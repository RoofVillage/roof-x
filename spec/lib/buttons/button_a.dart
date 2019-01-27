import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:icon_library/index.dart';
import '_button.dart';

class RoofButtonA extends StatelessWidget {
  final Function onTap;
  final String buttonText;
  final double buttonHeight;
  final SmallIconReference iconReference;

  const RoofButtonA({this.onTap, this.buttonText, this.buttonHeight, this.iconReference});

  @override
  Widget build(BuildContext context) {

    final _buttonDecoration = BoxDecoration(
        color: RoofColor.blue,
        borderRadius: BorderRadius.all(RoofCornerRadius.regular));

    final _textStyle = TextStyle(
        color: RoofColor.neutralColorA,
        fontSize: RoofFontSize.large,
        fontWeight: RoofFontWeight.extraThick);

    return RoofButton(
        onTap: onTap,
        buttonText: buttonText,
        iconReference: iconReference,
        buttonHeight: buttonHeight,
        buttonDecoration: _buttonDecoration,
        textDecoration: _textStyle);
  }
}
