import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';

import '../buttons/index.dart';

abstract class RoofNavBar extends StatelessWidget {
  List<RoofNavButton> actionButtonWidgetsForTheme(RoofInheritedTheme theme);
  List<Widget> navigationWidgetsForTheme(RoofInheritedTheme theme);

  final double _heightRatioToDevice = 0.5 * 0.25;
  final double _minHeight = RoofDistance.g;
  final _padding =
      EdgeInsets.fromLTRB(RoofDistance.a, 0, RoofDistance.a, RoofDistance.c);

  RoofNavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final diviceHeight = MediaQuery.of(context).size.height;
    final theme = RoofTheme.of(context);
    SystemChrome.setSystemUIOverlayStyle(theme.systemChromeStyle);

    final itemRow = Center(
        child: Column(
            // Stretch the cards in horizontal axis
            crossAxisAlignment: CrossAxisAlignment.stretch,

            ///Pushes sub-layout to the bottom.
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: navigationWidgetsForTheme(theme)),
            Row(children: actionButtonWidgetsForTheme(theme))
          ])
        ]));

    return Container(
        height: max(diviceHeight * _heightRatioToDevice, _minHeight),
        padding: _padding,
        decoration: BoxDecoration(color: theme.color.background.brandPrimary),
        child: itemRow);
  }
}
