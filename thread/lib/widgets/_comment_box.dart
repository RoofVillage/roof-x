import 'package:flutter/material.dart';
import 'package:spec/index.dart';

typedef void StringCallback(String val);

class CommentBox extends StatelessWidget {
  final StringCallback onChangeCallback;

  CommentBox({this.onChangeCallback});

  @override
  Widget build(BuildContext context) {
    final _enabledBorder = OutlineInputBorder(
        borderSide: BorderSide(color: RoofColor.neutralColorA),
        borderRadius: BorderRadius.all(RoofCornerRadius.regular));

    final _focusedBorder = OutlineInputBorder(
        borderSide: BorderSide(color: RoofColor.neutralColorA),
        borderRadius: BorderRadius.all(RoofCornerRadius.regular));

    final _hintStyle = TextStyle(color: RoofColor.neutralColorD);

    final _hintText = "Add comment";

    final _commentBoxDecoration = InputDecoration(
        contentPadding: EdgeInsets.all(RoofDistance.c),
        hintText: _hintText,
        border: OutlineInputBorder(),
        enabledBorder: _enabledBorder,
        focusedBorder: _focusedBorder,
        hintStyle: _hintStyle);

    return Expanded(
      child: TextField(
        decoration: _commentBoxDecoration,
        onChanged: (String string) => onChangeCallback(string),
      ),
    );
  }
}
