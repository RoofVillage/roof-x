import 'package:flutter/material.dart';
import 'package:spec/color.dart';
import 'package:spec/corner_radius.dart';
import 'package:spec/object_padding.dart';
import 'package:spec/font_size.dart';
import 'package:spec/distance.dart';
import 'package:spec/font_weight.dart';
import 'package:spec/device_haptic.dart';

import 'package:spec/bottom_sheet/bottom_sheet_route.dart';

// import 'package:roof/routes.dart';

class RoofButtonA extends StatefulWidget {
  final String text;
  final Future buttonAction;

  RoofButtonA({this.text, this.buttonAction});

  _RoofButtonAState createState() => _RoofButtonAState(text: text);
}

class _RoofButtonAState extends State<RoofButtonA> {
  String text;
  Future buttonAction;

  bool tapped = false;

  _RoofButtonAState({this.text, this.buttonAction});

  doTap() {
    VibrateDevice.lightImpact();
    setState(() {
      // tapped = true;
      tapped = !tapped;
    });
    Navigator.of(context).push(BottomSheetOverlay());
    // setState(() {
    //   tapped = await buttonAction();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: doTap,
        child: Opacity(
            opacity: tapped ? .75 : 1,
            child: Container(
                margin: RoofObjectPadding.fieldPaddingB(),
                padding: EdgeInsets.all(RoofDistance.c),
                decoration: BoxDecoration(
                    color: RoofColor.blue,
                    borderRadius: BorderRadius.all(RoofCornerRadius.regular)),
                child: Text(
                  text,
                  style: TextStyle(
                      color: RoofColor.neutralColorA,
                      fontSize: RoofFontSize.large,
                      fontWeight: RoofFontWeight.extraThick),
                  textAlign: TextAlign.center,
                ))));
  }
}
