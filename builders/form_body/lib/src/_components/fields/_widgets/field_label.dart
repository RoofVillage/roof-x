import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

class FieldLabel extends StatelessWidget {
  final String labelText;
  final int maxLines;

  static const _defaultMaxLines = 3;

  FieldLabel({
    Key key,
    @required this.labelText,
    this.maxLines = _defaultMaxLines,
  }) : super(key: key);

  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    return Text(
      labelText,
      softWrap: true,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: theme.typography.label.textStyle(
        color: theme.color.text.generalSecondary,
      ),
    );
  }
}
