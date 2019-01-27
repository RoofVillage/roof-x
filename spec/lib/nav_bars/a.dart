import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:icon_library/index.dart';

import 'package:spec/distance.dart';
import 'package:spec/nav_buttons/index.dart';
import 'package:spec/theme/index.dart';

class RoofNavBarA extends StatelessWidget {
  final NavigationIconReference centerIconReference;
  final RoofNavButton leftButton;
  final RoofNavButton rightButton;

  final double _heightRatioToDevice = 0.5 * 0.25;
  final double _minHeight = RoofDistance.g;
  final _horizontalPadding = RoofDistance.c;
  final _bottomPadding = RoofDistance.c;

  const RoofNavBarA(
      {Key key, this.centerIconReference, this.leftButton, this.rightButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final diviceHeight = MediaQuery.of(context).size.height;
    final theme = RoofTheme.of(context);
    SystemChrome.setSystemUIOverlayStyle(theme.systemChromeStyle);

    return Container(
        height: max(diviceHeight * _heightRatioToDevice, _minHeight),
        padding: EdgeInsets.fromLTRB(
            _horizontalPadding, 0, _horizontalPadding, _bottomPadding),
        decoration: BoxDecoration(color: theme.color.background.brand),
        child: _ItemRow(
            centerIconReference: centerIconReference,
            leftButton: leftButton,
            rightButton: rightButton));
  }
}

class _ItemRow extends StatelessWidget {
  final NavigationIconReference centerIconReference;
  final RoofNavButton leftButton;
  final RoofNavButton rightButton;

  _ItemRow(
      {Key key, this.centerIconReference, this.leftButton, this.rightButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    return Center(
        child: Column(
            // Stretch the cards in horizontal axis
            crossAxisAlignment: CrossAxisAlignment.stretch,

            ///Pushes sub-layout to the bottom.
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _relevantElements(
                  buttonIconColor: theme.color.icon.nav,
                  centerIconColor: theme.color.text.brand))
        ]));
  }

  List<Widget> _relevantElements(
      {Color buttonIconColor, Color centerIconColor}) {
    List<Widget> list = [leftButton];
    if (centerIconReference != null) {
      list.add(centerIconReference.buildSvg(color: centerIconColor));
    }
    list.add(rightButton);
    return list;
  }
}
