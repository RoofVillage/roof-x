import 'package:flutter/material.dart';
import 'package:typography/index.dart';
import 'package:theme/index.dart';

import 'action.dart';

class PrimaryActionKeyboardAccessoryButton
    extends ActionKeyboardAccessoryButton {
  final String title;
  final ContextPasser onTap;

  PrimaryActionKeyboardAccessoryButton({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme =RoofTheme.of(context);
    
    final textStyle = RoofTypography.button
        .textStyleWithColor(theme.color.text.submitAction);

    return buildButton(
      context: context,
      onTap: () => onTap(context),
      child: Container(
        color: theme.color.background.submitButton,
        child: Text(
          title,
          style: textStyle,
        ),
      ),
    );
  }
}
