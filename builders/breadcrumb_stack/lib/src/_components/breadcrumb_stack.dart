import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:icon_library/index.dart';
import 'package:haptics/index.dart';
import 'package:distance/index.dart' as distance;

import '../breadcrumb.dart';

class RoofBreadcrumbStack extends StatelessWidget {
  final List<RoofBreadcrumb> breadcrumbs;
  final VoidCallback onTap;

  RoofBreadcrumbStack({
    this.breadcrumbs,
    this.onTap,
  });

  final _verticalMargin = distance.c;
  final _verticalSpacing = distance.b;
  final _tapHapticOption = HapticOption.light;

  void _fireHaptic() {
    if (onTap != null) triggerHapticWith(_tapHapticOption);
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final arrowWidget = IconReference.rightArrowXSmall.buildSvg(
      color: theme.color.icon.secondary,
    );

    List<Widget> wrapChildren = [];

    for (int i = 0; i < breadcrumbs.length; i++) {
      List<Widget> breadcrumbRowChildren = [];

      breadcrumbRowChildren.add(breadcrumbs[i]);

      if (i < breadcrumbs.length - 1) {
        breadcrumbRowChildren.add(arrowWidget);
      }

      wrapChildren.add(
        Row(
          children: breadcrumbRowChildren,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      );
    }

    return GestureDetector(
      onTapDown: (details) => _fireHaptic(),
      onTap: onTap,
      child: Container(
        color: theme.color.background.generalPrimary,
        padding: EdgeInsets.symmetric(vertical: _verticalMargin),
        child: Wrap(
          runSpacing: _verticalSpacing,
          children: wrapChildren,
          crossAxisAlignment: WrapCrossAlignment.center,
        ),
      ),
    );
  }
}
