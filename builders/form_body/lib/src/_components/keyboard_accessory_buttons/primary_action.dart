import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:typedefs/index.dart';

import 'mixins/index.dart';

class PrimaryActionKeyboardAccessoryButton extends StatelessWidget
    with ActionKeyboardAccessoryButton {
  final String title;
  final ContextPasser onTap;

  PrimaryActionKeyboardAccessoryButton({
    @required this.title,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    return buildButton(
      context: context,
      onTap: () => onTap(context),
      child: Container(
        color: theme.color.background.actionPrimary,
        child: Center(
          child: Text(
            title,
            style: theme.typography.button.textStyle(
              color: theme.color.text.onActionPrimaryBackground,
            ),
          ),
        ),
      ),
    );
  }
}
