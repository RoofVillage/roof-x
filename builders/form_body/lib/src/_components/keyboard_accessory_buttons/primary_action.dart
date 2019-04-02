import 'package:flutter/material.dart';
import 'package:typography/index.dart';
import 'package:theme/index.dart';
import 'package:haptics/index.dart';

import 'mixins/index.dart';

class PrimaryActionKeyboardAccessoryButton extends StatelessWidget
    with ActionKeyboardAccessoryButton {
  final String title;
  final ContextPasser onTap;

  PrimaryActionKeyboardAccessoryButton(
      {@required this.title, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final textStyle =
        RoofTypography.button.textStyleWithColor(theme.color.text.submitAction);

    _onTap() {
      triggerHapticWith(HapticOption.light);
      onTap(context);
    }

    return buildButton(
      context: context,
      onTap: _onTap,
      child: Container(
        color: theme.color.background.submitButton,
        child: Center(
          child: Text(
            title,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
