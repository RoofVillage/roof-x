import 'package:flutter/material.dart';
import 'package:distance/index.dart' as distance;
import 'package:icon_library/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:theme/index.dart';
import 'package:haptics/index.dart';

class RoofBreadcrumb extends StatelessWidget {
  final String title;
  final StandardIconReference iconReference;
  final bool isActive;
  final VoidCallback onTap;

  RoofBreadcrumb({
    this.title,
    this.iconReference,
    this.isActive,
    this.onTap,
  });

  final _inactiveTypographyStyle = typography.detailSecondary;
  final _activeTypographyStyle = typography.detailPrimary;
  final _horizontalSpacing = distance.a;
  final _rightMargin = distance.c;
  final _bottomMargin = distance.c;

  _onTap() {
    triggerHapticWith(HapticOption.light);
    onTap();
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final inactiveTextStyle =
        _inactiveTypographyStyle.textStyleWithColor(theme.color.text.primary);
    final activeTextStyle =
        _activeTypographyStyle.textStyleWithColor(theme.color.text.brand);

    final inactiveIconColor = theme.color.icon.general;
    final activeIconColor = theme.color.icon.logo;

    List<Widget> rowChildren = [];

    if (iconReference != null) {
      final iconWidget = Padding(
        padding: EdgeInsets.only(right: _horizontalSpacing),
        child: iconReference.buildSvg(
          color: isActive ? activeIconColor : inactiveIconColor,
        ),
      );

      rowChildren.add(iconWidget);
    }

    final textWidget = Text(
      title,
      style: isActive ? activeTextStyle : inactiveTextStyle,
    );

    rowChildren.add(textWidget);

    if (!isActive) {
      final arrowWidgetWithRightMargin = Padding(
        padding: EdgeInsets.only(
          left: _horizontalSpacing,
          right: _rightMargin,
        ),
        child: IconReference.alarmClock.buildSvg(
          color: theme.color.icon.general,
        ),
      );

      rowChildren.add(arrowWidgetWithRightMargin);
    }

    return GestureDetector(
      onTap: _onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: _bottomMargin),
        child: Row(
          children: rowChildren,
        ),
      ),
    );
  }
}
