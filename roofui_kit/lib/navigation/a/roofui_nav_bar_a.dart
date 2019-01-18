import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:roofui_kit/util/roofui_color.dart';
import 'package:roofui_kit/util/roofui_icon_reference.dart';
import 'package:roofui_kit/util/roofui_distance.dart';
import 'package:roofui_kit/icon/roofui_standardized_icon.dart';

import './widgets/_center_icon.dart';

class RoofUINavBarA extends StatelessWidget {
  final RoofUINavigationIconReference centerIconReference;
  final RoofUINavigationIconReference leftIconReference;
  final RoofUINavigationIconReference rightIconReference;

  final double _heightRatioToDevice = 0.5 * 0.25;
  final double _minHeight = RoofUIDistance.g;
  final _backgroundColor = RoofUIColor.neutralColorC;
  final _horizontalPadding = RoofUIDistance.c;
  final _bottomPadding = RoofUIDistance.c;

  RoofUINavBarA(
      {Key key,
      this.centerIconReference,
      this.leftIconReference,
      this.rightIconReference})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final diviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: math.max(diviceHeight * _heightRatioToDevice, _minHeight),
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
    final blank = RoofUINavigationIconReference(path: "images/blank.svg");

    List<Widget> list = [
      RoofUIStandardizedIcon(iconReference: leftIconReference ?? blank)
    ];
    if (centerIconReference != null) {
      list.add(NavCenterIcon(iconReference: centerIconReference));
    }
    list.add(
        RoofUIStandardizedIcon(iconReference: rightIconReference ?? blank));
    return list;
  }
}
