import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:roofui_kit/util/roofui_color.dart';
import 'package:roofui_kit/util/roofui_asset_reference.dart';
import 'package:roofui_kit/util/roofui_distance.dart';
import 'package:roofui_kit/icon/roofui_standardized_icon.dart';

import './widget/_center_icon.dart';

class RoofUINavBarA extends StatelessWidget {
  final RoofUINavigationAssetReference centerAssetReference;
  final RoofUINavigationAssetReference leftAssetReference;
  final RoofUINavigationAssetReference rightAssetReference;

  final double _heightRatioToDevice = 0.5 * 0.25;
  final double _minHeight = RoofUIDistance.g;
  final _backgroundColor = RoofUIColor.neutralColorC;
  final _horizontalPadding = RoofUIDistance.c;
  final _bottomPadding = RoofUIDistance.c;

  RoofUINavBarA(
      {Key key,
      this.centerAssetReference,
      this.leftAssetReference,
      this.rightAssetReference})
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
    final blank = RoofUINavigationAssetReference(path: "images/blank.svg");

    List<Widget> list = [
      RoofUIStandardizedIcon(assetReference: leftAssetReference ?? blank)
    ];
    if (centerAssetReference != null) {
      list.add(NavCenterIcon(assetReference: centerAssetReference));
    }
    list.add(
        RoofUIStandardizedIcon(assetReference: rightAssetReference ?? blank));
    return list;
  }
}
