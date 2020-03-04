import 'package:flutter/material.dart';
import '_components/title_badge_cell.dart';

mixin TitleBadgeCellBuilder {
  TitleBadgeCell buildTitleBadgeCell({
    @required String title,
    String badgeText,
    void Function() onTap,
  }) =>
      TitleBadgeCell(
        title: title,
        badgeText: badgeText,
        onTap: onTap,
      );
}
