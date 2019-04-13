import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:distance/index.dart' as distance;
import 'package:corner_radius/index.dart' as radius;

class RoofFieldContainer extends StatelessWidget {
  final Widget child;

  RoofFieldContainer({this.child});

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final margin = EdgeInsets.symmetric(
      vertical: distance.a,
    );

    final padding = EdgeInsets.symmetric(
      vertical: distance.b,
      horizontal: distance.b,
    );

    final backgroundColor = theme.color.background.brandSolid;

    final borderRadius = radius.regular;

    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(borderRadius),
      ),
      child: child,
    );
  }
}
