import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';

class FloatingArtboardContainer extends StatelessWidget {
  final Widget child;

  final _margin = EdgeInsets.all(RoofDistance.d);
  final _padding = EdgeInsets.fromLTRB(
      RoofDistance.c, RoofDistance.c, RoofDistance.c, RoofDistance.f);

  FloatingArtboardContainer({@required this.child});

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

    return Container(
        margin: _margin,
        decoration: decoration,
        child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: pageContent));
  }
}
