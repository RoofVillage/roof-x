import 'package:flutter/material.dart';
import 'package:spec/index.dart';

class ConstrainedFloatingArtboardPage extends StatelessWidget {
  final Color color;

  final BoxShadow shadow;

  final Widget child;

  final _bottomSheetMargin = EdgeInsets.all(RoofDistance.f);
  final _sizeConstraints = BoxConstraints(maxHeight: 400);

  ConstrainedFloatingArtboardPage(
      {this.color, this.shadow, @required this.child});

  BoxDecoration get decoration => BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(RoofCornerRadius.large),
      boxShadow: [shadow]);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: _bottomSheetMargin,
        decoration: decoration,
        child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child:
                ConstrainedBox(constraints: _sizeConstraints, child: child)));
  }
}
