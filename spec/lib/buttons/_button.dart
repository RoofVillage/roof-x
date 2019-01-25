import 'package:flutter/material.dart';
import 'package:spec/object_padding.dart';
import 'package:spec/device_haptic.dart';

class RoofButton extends StatefulWidget {
  final Function onTap;
  final String buttonText;
  final EdgeInsets buttonPadding;
  final BoxDecoration buttonDecoration;
  final TextStyle textDecoration;

  const RoofButton(
      {this.onTap,
      this.buttonText,
      this.buttonPadding,
      this.buttonDecoration,
      this.textDecoration});

  _RoofButtonState createState() => _RoofButtonState(
      onTap: onTap,
      buttonPadding: buttonPadding,
      buttonDecoration: buttonDecoration,
      textDecoration: textDecoration);
}

class _RoofButtonState extends State<RoofButton> {
  Function onTap;
  String buttonText;
  EdgeInsets buttonPadding;
  BoxDecoration buttonDecoration;
  TextStyle textDecoration;

  _RoofButtonState(
      {this.onTap,
      this.buttonText,
      this.buttonPadding,
      this.buttonDecoration,
      this.textDecoration});

  @override
  Widget build(BuildContext context) {
    bool tapped = false;

    void doTap() {
      VibrateDevice.lightImpact();
      tapped = true;
      onTap().then(tapped = false);
    }

    return GestureDetector(
        onTap: doTap,
        child: Opacity(
            opacity: tapped ? .75 : 1,
            child: Container(
                margin: RoofObjectPadding.fieldPaddingB(),
                padding: buttonPadding,
                decoration: buttonDecoration,
                child: Text(
                  buttonText,
                  style: textDecoration,
                  textAlign: TextAlign.center,
                ))));
  }
}