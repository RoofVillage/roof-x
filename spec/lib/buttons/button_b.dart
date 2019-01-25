import 'package:flutter/material.dart';
import 'package:spec/color.dart';
import 'package:spec/corner_radius.dart';
import 'package:spec/font_size.dart';
import 'package:spec/distance.dart';
import 'package:spec/font_weight.dart';
import '_button.dart';

class RoofButtonB extends StatelessWidget {
  final Function onTap;
  final String buttonText;

  const RoofButtonB({this.onTap, this.buttonText});

  @override
  Widget build(BuildContext context) {
    EdgeInsets _buttonPadding = EdgeInsets.all(RoofDistance.c);

    BoxDecoration _buttonDecoration = BoxDecoration(
        border: Border.all(color: RoofColor.blue, width: 2.0),
        borderRadius: BorderRadius.all(RoofCornerRadius.regular));

    TextStyle _textStyle = TextStyle(
        color: RoofColor.blue,
        fontSize: RoofFontSize.large,
        fontWeight: RoofFontWeight.extraThick);

    return RoofButton(
        onTap: onTap,
        buttonText: buttonText,
        buttonPadding: _buttonPadding,
        buttonDecoration: _buttonDecoration,
        textDecoration: _textStyle);
  }
}
