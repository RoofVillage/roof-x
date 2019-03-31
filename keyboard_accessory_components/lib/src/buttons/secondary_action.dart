import 'package:flutter/material.dart';
import 'package:typography/index.dart';
import 'package:theme/index.dart';
import 'package:haptics/index.dart';

import 'action.dart';

class SecondaryActionKeyboardAccessoryButton
    extends ActionKeyboardAccessoryButton {
  final String title;
  final ContextPasser onTap;

  SecondaryActionKeyboardAccessoryButton({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final textStyle = RoofTypography.button
        .textStyleWithColor(theme.color.text.transitionAction);

    _onTap() {
      Haptic().triggerWith(HapticOption.click);
      onTap(context);
    }

    return buildButton(
      context: context,
      onTap: _onTap,
      child: Container(
        color: theme.color.background.transitionButton,
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
