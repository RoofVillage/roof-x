import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

import 'mixins/index.dart';

class PrimaryActionKeyboardAccessoryButton extends StatelessWidget
    with ActionKeyboardAccessoryButton {
  final String title;
  final void Function() onTap;

  PrimaryActionKeyboardAccessoryButton({
    @required this.title,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    return buildButton(
      context: context,
      onTap: onTap,
      backgroundColor: theme.color.background.actionPrimary,
      child: Center(
        child: Text(
          title,
          style: theme.typography.button.textStyle(
            color: theme.color.text.onActionPrimaryBackground,
          ),
        ),
      ),
    );
  }
}
