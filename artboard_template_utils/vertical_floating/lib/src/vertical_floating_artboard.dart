import 'dart:math';
import 'package:flutter/material.dart';
import 'package:artboard/index.dart';
import 'package:vertical_floating_artboard_button_option/index.dart';
import 'package:corner_radius/index.dart' as corner_radius;
import 'package:distance/index.dart' as distance;
import 'package:theme/index.dart';

mixin VerticalFloatingArtboard<T> implements StatefulWidget, Artboard<T> {
  VerticalFloatingArtboardButtonOption get navButtonOption => null;
}

mixin VerticalFloatingArtboardState<T extends VerticalFloatingArtboard>
    implements State<T>, ArtboardState<T> {
  final _margin =
      EdgeInsets.fromLTRB(distance.c, distance.e, distance.c, distance.c);
  final _padding =
      EdgeInsets.fromLTRB(distance.c, distance.c, distance.c, distance.f);

  Widget buildBody(BuildContext context);

  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    final decoration = BoxDecoration(
        color: theme.color.background.brandSolid,
        borderRadius: BorderRadius.all(corner_radius.large),
        boxShadow: [
          theme.shadow,
        ]);

    final pageContent = Container(padding: _padding, child: buildBody(context));

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
