import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:icon_library/index.dart';
import '_button.dart';

class RoofSubmitButton extends StatelessWidget {
  final Function onTap;
  final String buttonText;
  final double buttonHeight;
  final StandardIconReference iconReference;

  RoofSubmitButton(
      {this.onTap, this.buttonText, this.buttonHeight, this.iconReference});

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    final contentColor = theme.color.text.submitAction;

    final buttonDecoration = BoxDecoration(
        color: theme.color.background.submitButton,
        borderRadius: BorderRadius.all(RoofCornerRadius.regular));

    return RoofButton(
        onTap: onTap,
        buttonText: buttonText,
        iconReference: iconReference,
        buttonHeight: buttonHeight,
        buttonDecoration: buttonDecoration,
        contentColor: contentColor);
  }
}
