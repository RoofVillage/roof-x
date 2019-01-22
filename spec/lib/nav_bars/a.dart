import 'dart:math';

import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';

import 'package:spec/color.dart';
import 'package:spec/distance.dart';

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
        child: _IconRow(
            centerIconReference: centerIconReference,
            leftIconReference: leftIconReference,
            rightIconReference: rightIconReference));
  }
}

class _IconRow extends StatelessWidget {
  final NavigationIconReference centerIconReference;
  final NavigationIconReference leftIconReference;
  final NavigationIconReference rightIconReference;

  final _iconColor = RoofColor.neutralColorG;

  _IconRow(
      {Key key,
      this.centerIconReference,
      this.leftIconReference,
      this.rightIconReference})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            // Stretch the cards in horizontal axis
            crossAxisAlignment: CrossAxisAlignment.stretch,

            ///Pushes sub-layout to the bottom.
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _relevantElements())
        ]));
  }

  List<Widget> _relevantElements() {
    final blank = NavigationIconReference();

    List<Widget> list = [
      (leftIconReference ?? blank).buildSvg(color: _iconColor)
    ];
    if (centerIconReference != null) {
      list.add(centerIconReference.buildSvg(color: _iconColor));
    }
    list.add((rightIconReference ?? blank).buildSvg(color: _iconColor));
    return list;
  }
}
