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
      color: theme.color.background.general,
      borderRadius: BorderRadius.all(theme.radius.max),
      boxShadow: [
        theme.shadow.large,
      ],
    );

    final pageContent = Container(
      padding: EdgeInsets.only(
        top: theme.distance.gutter.vertical.medium,
        bottom: theme.distance.gutter.vertical.large * 3,
      ),
      child: buildBody(context),
    );

    final safeArea = MediaQuery.of(context).padding;

    final safeAreaMargin = EdgeInsets.only(
      top: max(
        theme.distance.gutter.vertical.large,
        safeArea.top,
      ),
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
