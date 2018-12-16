import 'package:flutter/material.dart';
import 'package:roofui_kit/util/roofui_icon_reference.dart';
import 'package:roofui_kit/navigation/a/index.dart';

class RoofUIScaffoldA extends StatelessWidget {
  final IconReference centerIconReference;
  final StandardizedIconReference leftIconReference;
  final StandardizedIconReference rightIconReference;
  final Widget body;

  RoofUIScaffoldA(
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
        RoofUINavBarA(
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
