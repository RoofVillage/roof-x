import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

class PageHeader extends StatelessWidget {
  final String title;

  PageHeader({
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final titleText = Padding(
      padding: EdgeInsets.symmetric(
        vertical: theme.distance.padding.vertical.medium,
      ),
      child: Text(
        title,
        style: theme.typography.headingPrimary.textStyle(
          color: theme.color.text.generalPrimary,
        ),
      ),
    );

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: theme.distance.gutter.horizontal.small,
        vertical: theme.distance.padding.vertical.medium,
      ),
      child: Row(
        children: [titleText],
      ),
    );
  }
}
