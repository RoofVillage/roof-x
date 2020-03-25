import 'package:flutter/material.dart';
import 'package:haptics/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:typedefs/index.dart';

import 'mixins/index.dart';

class SecondaryActionKeyboardAccessoryButton extends StatelessWidget
    with ActionKeyboardAccessoryButton {
  final String title;
  final void Function() onTap;

  SecondaryActionKeyboardAccessoryButton({
    @required this.title,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    _onTap() {
      triggerHapticWith(HapticOption.click);
      onTap();
    }

    return buildButton(
      context: context,
      onTap: _onTap,
      backgroundColor: theme.color.background.actionSecondary,
      child: Center(
        child: Text(
          title,
          style: theme.typography.button.textStyle(
            color: theme.color.text.onActionSecondaryBackground,
          ),
        ),
      ),
    );
  }
}
