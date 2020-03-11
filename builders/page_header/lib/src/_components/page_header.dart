import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

class PageHeader extends StatelessWidget {
  final String title;

  PageHeader({
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final titleText = Text(
      title,
      style: theme.typography.headingPrimary.textStyle(
        color: theme.color.text.generalPrimary,
      ),
    );

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: theme.distance.padding.vertical.large,
      ),
      child: Row(
        children: [titleText],
      ),
    );
  }
}
