import 'package:flutter/material.dart';
import 'package:standard_icon_library/index.dart';
import '_components/title_badge_cell.dart';

mixin TitleBadgeCellBuilder {
  TitleBadgeCell buildTitleBadgeCell({
    @required String title,
    String subtitle,
    StandardIcon icon,
    String badgeText,
    void Function() onTap,
  }) =>
      TitleBadgeCell(
        title: title,
        subtitle: subtitle,
        icon: icon,
        badgeText: badgeText,
        onTap: onTap,
      );
}
