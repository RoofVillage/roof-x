import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:distance/index.dart' as distance;

class RoofFieldContainer extends StatelessWidget {
  final Widget child;

  RoofFieldContainer({this.child});

  final double _minHeight = 50.0;
  final double _verticalSpacing = 1;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final margin = EdgeInsets.only(
      top: _verticalSpacing,
    );

    final padding = EdgeInsets.symmetric(
      vertical: distance.a,
      horizontal: distance.c,
    );

    final backgroundColor = theme.color.background.inputForeground;

    return Container(
      margin: margin,
      padding: padding,
      constraints: BoxConstraints(
        minHeight: _minHeight,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Center(child: child),
    );
  }
}
