import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

class SectionHeader extends StatelessWidget {
  final String text;
  final double horizontalGutter;
  final bool isNewSection;

  SectionHeader({
    @required this.text,
    this.horizontalGutter,
    bool isNewSection,
  }) : this.isNewSection = isNewSection ?? false;

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
        top: isNewSection
            ? theme.distance.spacing.vertical.max
            : theme.distance.spacing.vertical.large,
        bottom: theme.distance.spacing.vertical.small,
        left: horizontalGutter ?? 0,
        right: horizontalGutter ?? 0,
      ),
    );
  }
}
