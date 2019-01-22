import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';

import 'package:spec/nav_bars/index.dart';

class RoofScaffoldA extends StatelessWidget {
  final NavigationIconReference centerIconReference;
  final NavigationIconReference leftIconReference;
  final NavigationIconReference rightIconReference;
  final Widget body;

  RoofScaffoldA(
      {Key key,
      this.body,
      this.centerIconReference,
      this.leftIconReference,
      this.rightIconReference})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      // Stretch the cards in horizontal axis
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        RoofNavBarA(
            centerIconReference: centerIconReference,
            leftIconReference: leftIconReference,
            rightIconReference: rightIconReference),
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
