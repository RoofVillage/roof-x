import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final double horizontalGutter;
  final bool withPadding;

  SectionHeader({
    @required this.title,
    this.subtitle,
    this.horizontalGutter,
    bool withPadding,
  }) : this.withPadding = withPadding ?? true;

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final titleText = Text(
      title,
      style: theme.typography.title.textStyle(
        color: theme.color.text.generalSecondary,
      ),
    );

    final columnChildren = <Widget>[titleText];

    if (subtitle?.isNotEmpty ?? false) {
      final subtitleText = Padding(
        padding: EdgeInsets.symmetric(
          vertical: theme.distance.spacing.vertical.small,
        ),
        child: Text(
          subtitle,
          style: theme.typography.subtitle.textStyle(
            color: theme.color.text.generalSecondary,
          ),
        ),
      );

      columnChildren.add(subtitleText);
    }

    return Padding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: columnChildren,
      ),
      padding: EdgeInsets.only(
        top: withPadding
            ? theme.distance.spacing.vertical.max
            : theme.distance.spacing.vertical.small,
        bottom: theme.distance.spacing.vertical.small,
        left: horizontalGutter ?? 0,
        right: horizontalGutter ?? 0,
      ),
    );
  }
}
