import 'package:flutter/material.dart';
import 'package:distance/index.dart' as distance;
import 'package:icon_library/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:theme/index.dart';
import 'package:haptics/index.dart';

class RoofBreadcrumb extends StatelessWidget {
  final String title;
  final SmallIconReference iconReference;
  final VoidCallback onTap;

  RoofBreadcrumb({
    this.title,
    this.iconReference,
    this.onTap,
  });

  final _typographyStyle = typography.detailSecondary;
  final _horizontalSpacing = distance.b;
  final _horizontalMargin = distance.b;
  final _topMargin = distance.a;

  _onTap() {
    triggerHapticWith(HapticOption.light);
    onTap();
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final textStyle = _typographyStyle.textStyleWithColor(
      theme.color.text.secondary,
    );

    final iconColor = theme.color.icon.general;

    final backgroundColor = theme.color.background.generalSecondary;

    List<Widget> rowChildren = [];

    if (iconReference != null) {
      final iconWidget = Padding(
        padding: EdgeInsets.only(right: _horizontalSpacing),
        child: iconReference.buildSvg(color: iconColor),
      );

      rowChildren.add(iconWidget);
    }

    final textWidget = Flexible(
      child: Text(title, style: textStyle),
    );

    rowChildren.add(textWidget);

    final arrowWidget = Padding(
      padding: EdgeInsets.only(
        left: _horizontalSpacing,
      ),
      child: IconReference.rightArrow.buildSvg(
        color: theme.color.icon.general,
      ),
    );

    // rowChildren.add(arrowWidget);

    return GestureDetector(
      onTap: _onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: _topMargin),
        padding: EdgeInsets.symmetric(horizontal: _horizontalMargin),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: rowChildren,
        ),
      ),
    );
  }
}
