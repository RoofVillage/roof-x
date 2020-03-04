import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

class CellBodyTextPreview extends StatelessWidget {
  final String text;

  CellBodyTextPreview(this.text);

  final _maxLines = 2;
  final _overflowKind = TextOverflow.ellipsis;

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    return Text(
      text,
      style: theme.typography.body.textStyle(
        color: theme.color.text.generalSecondary,
      ),
      maxLines: _maxLines,
      overflow: _overflowKind,
    );
  }
}
