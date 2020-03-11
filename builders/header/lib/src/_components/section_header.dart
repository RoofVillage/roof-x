import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

class SectionHeader extends StatelessWidget {
  final String text;
  final double horizontalGutter;

  SectionHeader({
    @required this.text,
    this.horizontalGutter,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    return Padding(
      child: Row(
        children: [
          Text(
            text,
            style: theme.typography.title.textStyle(
              color: theme.color.text.generalSecondary,
            ),
          ),
        ],
      ),
      padding: EdgeInsets.only(
        top: theme.distance.spacing.vertical.large,
        bottom: theme.distance.spacing.vertical.small,
        left: horizontalGutter ?? 0,
        right: horizontalGutter ?? 0,
      ),
    );
  }
}
