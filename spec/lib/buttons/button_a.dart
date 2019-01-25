import 'package:flutter/material.dart';
import 'package:spec/color.dart';
import 'package:spec/corner_radius.dart';
import 'package:spec/font_size.dart';
import 'package:spec/distance.dart';
import 'package:spec/font_weight.dart';
import '_button.dart';

class RoofButtonA extends StatelessWidget {
  final Function onTap;
  final String buttonText;

  const RoofButtonA({this.onTap, this.buttonText});

  @override
  Widget build(BuildContext context) {
    EdgeInsets _buttonPadding = EdgeInsets.all(RoofDistance.c);

    BoxDecoration _buttonDecoration = BoxDecoration(
        color: RoofColor.blue,
        borderRadius: BorderRadius.all(RoofCornerRadius.regular));

    TextStyle _textStyle = TextStyle(
        color: RoofColor.neutralColorA,
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
