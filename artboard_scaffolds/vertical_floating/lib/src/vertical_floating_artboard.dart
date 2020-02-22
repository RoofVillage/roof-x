import 'dart:math';
import 'package:flutter/material.dart';
import 'package:artboard/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:vertical_floating_artboard_button_option/index.dart';

mixin VerticalFloatingArtboard<T> implements StatefulWidget, Artboard<T> {
  VerticalFloatingArtboardButtonOption get navButtonOption => null;
}

mixin VerticalFloatingArtboardState<T extends VerticalFloatingArtboard>
    implements State<T>, ArtboardState<T> {
  Widget buildBody(BuildContext context);

  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final decoration = BoxDecoration(
      color: theme.color.background.inputBackground,
      borderRadius: BorderRadius.all(theme.radius.max),
      boxShadow: [
        theme.shadow.medium,
      ],
    );

    final pageContent = Container(
      padding: EdgeInsets.fromLTRB(
        0,
        theme.distance.gutter.vertical.medium,
        0,
        theme.distance.gutter.vertical.medium * 4,
      ),
      child: buildBody(context),
    );

    final safeArea = MediaQuery.of(context).padding;

    final margin = EdgeInsets.fromLTRB(
      theme.distance.gutter.horizontal.medium,
      theme.distance.gutter.vertical.large,
      theme.distance.gutter.horizontal.medium,
      theme.distance.gutter.vertical.medium,
    );
    final safeAreaMargin = EdgeInsets.fromLTRB(
      margin.left,
      max(margin.top, safeArea.top),
      margin.right,
      max(margin.bottom, safeArea.bottom),
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
