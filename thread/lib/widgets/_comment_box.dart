import 'package:flutter/material.dart';
import 'package:spec/index.dart';

typedef void StringCallback(String val);

class CommentBox extends StatelessWidget {
  final StringCallback onChangeCallback;

  CommentBox({this.onChangeCallback});

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    // Leave these borders transparent for now, they may use color when the box expands
    final enabledBorder = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(RoofCornerRadius.regular));
    final focusedBorder = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(RoofCornerRadius.regular));

    final hintStyle = TextStyle(color: theme.color.text.placeholder);

    final textStyle = TextStyle(color: theme.color.text.primary);

    final hintText = "Add comment";

    final commentBoxDecoration = InputDecoration(
        contentPadding: EdgeInsets.all(RoofDistance.c),
        hintText: hintText,
        border: OutlineInputBorder(),
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        hintStyle: hintStyle);

    final double maxHeight = 200;

    return Expanded(
        child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: maxHeight),
            child: TextField(
                maxLines: null,
                style: textStyle,
                textInputAction: TextInputAction.done,
                decoration: commentBoxDecoration,
                onChanged: (String string) => onChangeCallback(string))));
  }
}
