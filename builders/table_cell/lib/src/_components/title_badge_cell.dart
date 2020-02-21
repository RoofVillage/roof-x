import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

import '_standard_cell.dart';

class TitleBadgeCell extends StatelessWidget {
  final String title;
  final String badgeText;
  final void Function() onTap;

  TitleBadgeCell({
    @required this.title,
    this.badgeText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final List<Widget> rowChildren = [];

    final nameText = Text(
      title,
      style: theme.typography.title.textStyle(
        color: theme.color.text.generalPrimary,
      ),
    );

    if (badgeText != null) {
      final notificationText = Text(
        badgeText,
        style: theme.typography.bodyHeavy.textStyle(
          color: theme.color.text.action,
        ),
      );
      rowChildren.addAll([
        Expanded(
          child: nameText,
        ),
        notificationText,
      ]);
    } else {
      rowChildren.add(nameText);
    }

    return StandardCell(
      child: Row(children: rowChildren),
      onTap: onTap,
    );
  }
}
