import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart';

typedef void StringCallback(String val);

class CommentBox extends StatelessWidget {
  static final _hintText = "Add comment";

  final StringCallback onChangeCallback;

  CommentBox({this.onChangeCallback});

  final _commentTextStyle = RoofTypography.bodyPrimary;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final enabledBorder =
        OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent));
    final focusedBorder =
        OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent));
    final errorBorder = OutlineInputBorder(
        borderSide: BorderSide(color: theme.color.stroke.alert),
        borderRadius: BorderRadius.all(RoofCornerRadius.regular));

    final hintStyle =
        _commentTextStyle.textStyleWithColor(theme.color.text.placeholder);

    final textStyle =
        _commentTextStyle.textStyleWithColor(theme.color.text.primary);

    final commentBoxDecoration = InputDecoration(
        contentPadding: EdgeInsets.all(RoofDistance.c),
        hintText: _hintText,
        border: OutlineInputBorder(),
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
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
