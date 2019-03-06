import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';

import 'button.dart';
import 'field.dart';

class RoofInputDock extends StatefulWidget {
  final DockActionButton dockActionButton;
  final List<Widget> auxiliaryWidgets;

  RoofInputDock({this.dockActionButton, this.auxiliaryWidgets});

  @override
  State<StatefulWidget> createState() => _RoofInputDockState();
}

class _RoofInputDockState extends State<RoofInputDock>
    with SingleTickerProviderStateMixin {
  bool inputHasText = false;

  void updateCommentFocus(String inputText) {
    print("updateCommentFocus: $inputText");
    if (inputText.isNotEmpty && !inputHasText) {
      inputHasText = true;
      setState(() {
        inputHasText = true;
      });
    } else if (inputText.isEmpty && inputHasText) {
      setState(() {
        inputHasText = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("rebuild dock, inputHasText: $inputHasText");
    List<Widget> rowChildren = [];

    if (widget.auxiliaryWidgets != null && widget.auxiliaryWidgets.isNotEmpty) {
      rowChildren.addAll(widget.auxiliaryWidgets);
    }

    final commentBox =
        DockInputField(onChange: (String text) => updateCommentFocus(text));
    rowChildren.add(commentBox);

    if (widget.dockActionButton != null) {
      rowChildren.add(widget.dockActionButton.build(shrink: inputHasText));
    }

    final EdgeInsets bottomBarPadding = RoofObjectPadding.container1;

    final Widget contentRow = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: rowChildren,
    );

    final theme = RoofTheme.of(context);
    return SafeArea(
        top: false,
        left: false,
        right: false,
        child: Container(
          color: theme.color.background.brandPrimary,
          padding: bottomBarPadding,
          child: contentRow,
        ));
  }
}
