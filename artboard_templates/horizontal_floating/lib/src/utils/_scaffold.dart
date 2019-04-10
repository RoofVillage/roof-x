import 'dart:math';

import 'package:flutter/material.dart';
import 'package:distance/index.dart' as distance;
import 'package:corner_radius/index.dart' as corner_radius;
import 'package:theme/index.dart';

class HorizontalFloatingArtboardScaffold extends StatelessWidget {
  final Widget child;

  final _margin =
      EdgeInsets.fromLTRB(distance.e, distance.c, distance.c, distance.c);
  final _padding =
      EdgeInsets.fromLTRB(distance.c, distance.c, distance.c, distance.c);

  HorizontalFloatingArtboardScaffold({@required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    final decoration = BoxDecoration(
        color: theme.color.background.brandSolid,
        borderRadius: BorderRadius.all(corner_radius.large),
        boxShadow: [
          theme.shadow,
        ]);

    final pageContent = Container(padding: _padding, child: child);

    final safeArea = MediaQuery.of(context).padding;
    final safeAreaMargin = EdgeInsets.fromLTRB(
        _margin.left,
        max(_margin.top, safeArea.top),
        _margin.right,
        max(_margin.bottom, safeArea.bottom));

    final nonClickableSurface = GestureDetector(
        behavior: HitTestBehavior.opaque, onTap: () {}, child: pageContent);

    return Container(
        margin: safeAreaMargin,
        decoration: decoration,
        child: nonClickableSurface);
  }
}
