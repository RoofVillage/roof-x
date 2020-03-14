import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:vertically_centered_text_builder/index.dart';

import 'card_cell.dart';

class TitleBadgeCell extends StatelessWidget
    with VerticallyCenteredTextBuilder {
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

    final nameText = buildVerticallyCenteredText(
      Text(
        title,
        style: theme.typography.title.textStyle(
          color: theme.color.text.generalPrimary,
        ),
      ),
    );

    if (badgeText != null) {
      final notificationText = buildVerticallyCenteredText(
        Text(
          badgeText,
          style: theme.typography.bodyHeavy.textStyle(
            color: theme.color.text.action,
          ),
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

    return CardCell(
      child: Row(children: rowChildren),
      onTap: onTap,
    );
  }
}
