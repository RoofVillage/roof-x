import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:theme/index.dart';
import 'package:haptics/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:distance/index.dart' as distance;

class RoofBreadcrumb extends StatelessWidget {
  final String title;
  final XSmallIconReference iconReference;
  final VoidCallback onTap;

  RoofBreadcrumb({
    this.title,
    this.iconReference,
    this.onTap,
  });

  final _typographyStyle = typography.bodySecondary;
  final _horizontalSpacing = distance.b;
  final _horizontalMargin = distance.b;
  final _tapHapticOption = HapticOption.light;

  void _fireHaptic() {
    if (onTap != null) triggerHapticWith(_tapHapticOption);
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final textStyle = _typographyStyle.textStyleWithColor(
      theme.color.text.secondary,
    );

    final iconColor = theme.color.icon.secondary;

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

    return GestureDetector(
      onTapDown: (details) => _fireHaptic(),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: _horizontalMargin),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: rowChildren,
        ),
      ),
    );
  }
}
