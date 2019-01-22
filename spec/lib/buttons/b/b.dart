import 'package:flutter/material.dart';
import 'package:spec/color.dart';
import 'package:spec/corner_radiuses.dart';
import 'package:spec/object_padding.dart';
import 'package:spec/font_size.dart';
import 'package:spec/distance.dart';
import 'package:spec/font_weight.dart';

class RoofButtonB extends StatelessWidget {
  final String text;
  final Function onTap;

  RoofButtonB({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            margin: RoofObjectPadding.fieldPaddingB(),
            padding: EdgeInsets.all(RoofDistance.c),
            decoration: BoxDecoration(
                border: Border.all(color: RoofColor.highlight, width: 2.0),
                borderRadius: BorderRadius.all(RoofCornerRadius.regular)),
            child: Text(text,
                style: TextStyle(
                    color: RoofColor.highlight,
                    fontSize: RoofFontSize.large,
                    fontWeight: RoofFontWeight.extraThick),
                textAlign: TextAlign.center)));
  }
}
