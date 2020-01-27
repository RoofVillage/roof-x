import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

import '_wrapping_text.dart';

class CellPrimaryTitle extends StatelessWidget {
  final String text;

  CellPrimaryTitle(this.text);

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    return WrappingText(
      text: text,
      style: theme.typography.bodyHeavy.textStyle(
        color: theme.color.text.action,
      ),
    );
  }
}
