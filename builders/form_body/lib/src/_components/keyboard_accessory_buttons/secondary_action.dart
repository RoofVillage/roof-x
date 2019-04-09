import 'package:flutter/material.dart';
import 'package:typography/index.dart';
import 'package:theme/index.dart';
import 'package:haptics/index.dart';

import 'mixins/index.dart';

class SecondaryActionKeyboardAccessoryButton extends StatelessWidget
    with ActionKeyboardAccessoryButton {
  final String title;
  final ContextPasser onTap;
  SecondaryActionKeyboardAccessoryButton(
      {@required this.title, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final textStyle = RoofTypography.button
        .textStyleWithColor(theme.color.text.secondaryAction);

    _onTap() {
      triggerHapticWith(HapticOption.click);
      onTap(context);
    }

    return buildButton(
      context: context,
      onTap: _onTap,
      child: Container(
        color: theme.color.background.secondaryAction,
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
