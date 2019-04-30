import 'package:flutter/material.dart';
import 'package:theme/index.dart';
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

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    List<Widget> columnChildren = [];

    columnChildren.addAll(breadcrumbs);

    return Container(
      margin: EdgeInsets.symmetric(vertical: _verticalMargin),
      child: Row(
        children: [
          Wrap(
            children: columnChildren,
          ),
        ],
      ),
    );
  }
}
