import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';

class HorizontalFloatingArtboardScaffold extends StatelessWidget {
  final Widget child;

  final _margin = EdgeInsets.fromLTRB(
      RoofDistance.e, RoofDistance.c, RoofDistance.c, RoofDistance.c);
  final _padding = EdgeInsets.fromLTRB(
      RoofDistance.c, RoofDistance.c, RoofDistance.c, RoofDistance.c);

  HorizontalFloatingArtboardScaffold({@required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    final decoration = BoxDecoration(
        color: theme.color.background.brandSolid,
        borderRadius: BorderRadius.all(RoofCornerRadius.large),
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
