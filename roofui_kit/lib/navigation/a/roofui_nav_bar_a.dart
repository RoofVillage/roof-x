import 'package:flutter/material.dart';

import 'widgets/center_icon.dart';

import 'package:roofui_kit/icon/index.dart';
import 'package:roofui_kit/util/roofui_color.dart';
import 'package:roofui_kit/util/roofui_icon_reference.dart';

class RoofUINavBarA extends StatelessWidget {
  final IconReference centerIconReference;
  final StandardizedIconReference leftIconReference;
  final StandardizedIconReference rightIconReference;

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
      height: diviceHeight * 0.5 * 0.25,
      decoration: BoxDecoration(color: RoofUIColor.neutralColorC),
      child: Center(
          child: Column(
        // Stretch the cards in horizontal axis
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.red)),
                    child: RoofUIStandardizedIcon(
                        iconReference: leftIconReference)),
                Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.blue)),
                    child: NavCenterIcon(iconReference: centerIconReference)),
                Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.green)),
                    child: RoofUIStandardizedIcon(
                        iconReference: rightIconReference)),
              ])
        ],
      )),
    );
  }
}
