import 'package:flutter/material.dart';
import 'package:spec/font_size.dart';
import 'package:spec/font_weight.dart';
import 'package:spec/color.dart';

class RoofFieldLabel extends StatelessWidget {
  final String labelText;
  final int maxLines;

  RoofFieldLabel({Key key, this.labelText, this.maxLines = 1})
      : super(key: key);

  Widget build(BuildContext context) {
    return Text(labelText,
        softWrap: true,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: _labelStyle());
  }

  TextStyle _labelStyle() {
    return TextStyle(
        fontSize: RoofFontSize.small,
        fontWeight: RoofFontWeight.thick,
        color: RoofColor.neutralColorG);
  }
}
