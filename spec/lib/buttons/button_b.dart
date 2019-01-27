import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:icon_library/index.dart';
import '_button.dart';

class RoofButtonB extends StatelessWidget {
  final Function onTap;
  final String buttonText;
  final double buttonHeight;
  final SmallIconReference iconReference;

  const RoofButtonB({this.onTap, this.buttonText, this.buttonHeight, this.iconReference});

  @override
  Widget build(BuildContext context) {
    final _buttonDecoration = BoxDecoration(
        border: Border.all(color: RoofColor.blue, width: 2.0),
        borderRadius: BorderRadius.all(RoofCornerRadius.regular));

    final _textStyle = TextStyle(
        color: RoofColor.blue,
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
