import 'dart:math';

import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';

import 'package:spec/color.dart';
import 'package:spec/distance.dart';

import 'widgets/_nav_icon.dart';

class RoofNavBarA extends StatelessWidget {
  final NavigationIconReference centerIconReference;
  final NavigationIconReference leftIconReference;
  final NavigationIconReference rightIconReference;

  final double _heightRatioToDevice = 0.5 * 0.25;
  final double _minHeight = RoofDistance.g;
  final _backgroundColor = RoofColor.neutralColorC;
  final _horizontalPadding = RoofDistance.c;
  final _bottomPadding = RoofDistance.c;

  RoofNavBarA(
      {Key key,
      this.centerIconReference,
      this.leftIconReference,
      this.rightIconReference})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final diviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: max(diviceHeight * _heightRatioToDevice, _minHeight),
      padding: EdgeInsets.fromLTRB(
          _horizontalPadding, 0, _horizontalPadding, _bottomPadding),
      decoration: BoxDecoration(color: _backgroundColor),
      child: Center(
          child: Column(
        // Stretch the cards in horizontal axis
        crossAxisAlignment: CrossAxisAlignment.stretch,

        ///Pushes sub-layout to the bottom.
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _relevantElements())
        ],
      )),
    );
  }

  List<Widget> _relevantElements() {
    final blank = NavigationIconReference();

    List<Widget> list = [NavIcon(iconReference: leftIconReference ?? blank)];
    if (centerIconReference != null) {
      list.add(NavIcon(iconReference: centerIconReference));
    }
    list.add(NavIcon(iconReference: rightIconReference ?? blank));
    return list;
  }
}
