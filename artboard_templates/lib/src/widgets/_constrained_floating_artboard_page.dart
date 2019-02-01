import 'package:flutter/material.dart';
import 'package:spec/index.dart';

class ConstrainedFloatingArtboardPage extends StatelessWidget {
  final Color color;

  final BoxShadow shadow;

  final Widget child;

  final _margin = EdgeInsets.all(RoofDistance.d);
  final _padding = EdgeInsets.fromLTRB(
      RoofDistance.c, RoofDistance.c, RoofDistance.c, RoofDistance.f);

  ConstrainedFloatingArtboardPage(
      {this.color, this.shadow, @required this.child});

  BoxDecoration get decoration => BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(RoofCornerRadius.large),
      boxShadow: [shadow]);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: _padding,
        margin: _margin,
        decoration: decoration,
        child: GestureDetector(
            behavior: HitTestBehavior.opaque, onTap: () {}, child: child));
  }
}
