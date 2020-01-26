import 'package:flutter/material.dart';
import 'package:haptics/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:typedefs/index.dart';

import 'mixins/index.dart';

class SecondaryActionKeyboardAccessoryButton extends StatelessWidget
    with ActionKeyboardAccessoryButton {
  final String title;
  final ContextPasser onTap;
  
  SecondaryActionKeyboardAccessoryButton({
    @required this.title,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    _onTap() {
      triggerHapticWith(HapticOption.click);
      onTap(context);
    }

    return buildButton(
      context: context,
      onTap: _onTap,
      child: Container(
        color: theme.color.background.actionSecondary,
        child: Center(
          child: Text(
            title,
            style: theme.typography.button.textStyle(
              color: theme.color.text.actionSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
