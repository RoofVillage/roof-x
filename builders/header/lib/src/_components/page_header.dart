import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

class PageHeader extends StatelessWidget {
  final String text;
  final double horizontalGutter;

  PageHeader({
    @required this.text,
    this.horizontalGutter,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final titleText = Text(
      text,
      style: theme.typography.headingPrimary.textStyle(
        color: theme.color.text.generalPrimary,
      ),
    );

    return Padding(
      child: Row(
        children: [titleText],
      ),
      padding: EdgeInsets.symmetric(
        vertical: theme.distance.padding.vertical.large,
        horizontal: horizontalGutter,
      ),
    );
  }
}
