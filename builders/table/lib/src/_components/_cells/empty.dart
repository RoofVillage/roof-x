import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

class EmptyMessageCell extends StatelessWidget {
  final String text;

  EmptyMessageCell({this.text});

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final textWidget = Text(
      text,
      style: theme.typography.body.textStyle(
        color: theme.color.text.inputPlaceholder,
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: theme.distance.padding.vertical.large,
      ),
      child: Center(
        child: textWidget,
      ),
    );
  }
}
