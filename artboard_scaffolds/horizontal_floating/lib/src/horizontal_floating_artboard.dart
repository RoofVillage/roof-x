import 'dart:math';
import 'package:flutter/material.dart';
import 'package:artboard/index.dart';

import 'package:distance/index.dart' as distance;
import 'package:corner_radius/index.dart' as corner_radius;
import 'package:theme/index.dart';

mixin HorizontalFloatingArtboard<T> implements StatefulWidget, Artboard<T> {}

mixin HorizontalFloatingArtboardState<T extends HorizontalFloatingArtboard>
    implements State<T>, ArtboardState<T> {
  final _margin =
      EdgeInsets.fromLTRB(distance.e, distance.c, distance.c, distance.c);
  final _padding =
      EdgeInsets.fromLTRB(distance.c, distance.c, distance.c, distance.c);

  Widget buildBody(BuildContext context);

  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    final decoration = BoxDecoration(
      color: theme.color.background.generalSecondary,
      borderRadius: BorderRadius.all(corner_radius.large),
      boxShadow: [
        theme.shadow,
      ],
    );

    final pageContent = Container(padding: _padding, child: buildBody(context));

    final safeArea = MediaQuery.of(context).padding;
    final safeAreaMargin = EdgeInsets.fromLTRB(
      _margin.left,
      max(_margin.top, safeArea.top),
      _margin.right,
      max(_margin.bottom, safeArea.bottom),
    );

    final nonClickableSurface = GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: pageContent,
    );

    return Container(
      margin: safeAreaMargin,
      decoration: decoration,
      child: nonClickableSurface,
    );
  }
}
