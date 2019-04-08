import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';

class VerticalFloatingArtboardScaffold extends StatelessWidget {
  final Widget child;

  final _margin = EdgeInsets.fromLTRB(
      RoofDistance.c, RoofDistance.e, RoofDistance.c, RoofDistance.c);
  final _padding = EdgeInsets.fromLTRB(
      RoofDistance.c, RoofDistance.c, RoofDistance.c, RoofDistance.f);

  VerticalFloatingArtboardScaffold({@required this.child});

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

    final safeArea = MediaQuery.of(context).padding.bottom;
    final safeAreaMargin = EdgeInsets.fromLTRB(
        _margin.left, _margin.top, _margin.right, _margin.bottom + safeArea);

    return Container(
        margin: safeAreaMargin,
        decoration: decoration,
        child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: pageContent));
  }
}
