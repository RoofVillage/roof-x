import 'package:flutter/material.dart';

import 'package:roofui_kit/util/roofui_asset_reference.dart';
import 'package:roofui_kit/navigation/a/roofui_nav_bar_a.dart';

class RoofUIScaffoldA extends StatelessWidget {
  final RoofUINavigationAssetReference centerAssetReference;
  final RoofUINavigationAssetReference leftAssetReference;
  final RoofUINavigationAssetReference rightAssetReference;
  final Widget body;

  RoofUIScaffoldA(
      {Key key,
      this.body,
      this.centerAssetReference,
      this.leftAssetReference,
      this.rightAssetReference})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      // Stretch the cards in horizontal axis
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        RoofUINavBarA(
            centerAssetReference: centerAssetReference,
            leftAssetReference: leftAssetReference,
            rightAssetReference: rightAssetReference),
        Expanded(
            /*
              Wrap in MediaQuery to remove the top padding that the Scaffold will assume is necessary.
              See https://github.com/flutter/flutter/issues/14842
            */
            child: MediaQuery.removePadding(
                context: context, removeTop: true, child: body))
      ],
    )));
  }
}
