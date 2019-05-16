import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:icon_library/index.dart';
import 'package:distance/index.dart' as distance;

import '../breadcrumb.dart';

class RoofBreadcrumbStack extends StatelessWidget {
  final List<RoofBreadcrumb> breadcrumbs;
  final String title;

  RoofBreadcrumbStack({
    this.breadcrumbs,
    this.title,
  });

  final _verticalMargin = distance.c;
  final _verticalSpacing = distance.b;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final arrowWidget = IconReference.rightArrowXSmall.buildSvg(
      color: theme.color.icon.general,
    );

    List<Widget> wrapChildren = [];

    for (int i = 0; i < breadcrumbs.length; i++) {
      List<Widget> breadcrumbRowChildren = [breadcrumbs[i]];

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

    return Container(
      margin: EdgeInsets.symmetric(vertical: _verticalMargin),
      child: Wrap(
        runSpacing: _verticalSpacing,
        children: wrapChildren,
        crossAxisAlignment: WrapCrossAlignment.center,
      ),
    );
  }
}
