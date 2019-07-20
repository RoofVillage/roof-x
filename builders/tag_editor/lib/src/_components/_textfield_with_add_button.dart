import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:distance/index.dart' as distance;
import 'package:typography/index.dart' as typography;

class TextFieldWithAddButton extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) addTagCallback;
  final List<String> options;

  TextFieldWithAddButton({
    @required this.controller,
    @required this.addTagCallback,
    this.options,
  });

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final List<Widget> fieldRowChildren = [];

    final decoration = InputDecoration(
      hintText: "big house",
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
      hintStyle: typography.body.textStyleWithColor(
        theme.color.text.placeholder,
      ),
    );

    final textField = Expanded(
      child: Container(
        child: TextField(
          autofocus: true,
          controller: controller,
          style: typography.body.textStyleWithColor(theme.color.text.primary),
          decoration: decoration,
        ),
      ),
    );

    fieldRowChildren.add(textField);

    if (controller.text.isNotEmpty) {
      bool canCreateTag = !options
          .map((option) => option.toLowerCase())
          .contains(controller.text.toLowerCase());

      final Widget addButton = GestureDetector(
        onTap: canCreateTag ? () => addTagCallback(controller.text) : null,
        child: Container(
          padding: EdgeInsets.only(
            left: distance.c,
            top: distance.b,
            bottom: distance.b,
          ),
          child: Text(
            "Create tag",
            style: typography.button.textStyleWithColor(
              canCreateTag
                  ? theme.color.text.secondaryAction
                  : theme.color.text.inactiveAction,
            ),
          ),
        ),
      );

      fieldRowChildren.add(addButton);
    }

    return Container(
      padding: EdgeInsets.only(bottom: distance.b),
      margin: EdgeInsets.symmetric(vertical: distance.b),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: theme.color.stroke.light)),
      ),
      child: Row(
        children: fieldRowChildren,
      ),
    );
  }
}
