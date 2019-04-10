import 'package:flutter/material.dart';
import 'package:typography/index.dart' as typography;
import 'package:theme/index.dart';
import 'package:haptics/index.dart';
import 'package:typedefs/index.dart';

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

    final textStyle =
        typography.button.textStyleWithColor(theme.color.text.transitionAction);

    _onTap() {
      triggerHapticWith(HapticOption.click);
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
