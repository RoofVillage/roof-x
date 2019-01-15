import 'package:flutter/material.dart';
import 'package:roofui_kit/util/roofui_color.dart';
import 'package:roofui_kit/util/roofui_font_weight.dart';
import 'package:roofui_kit/util/roofui_font_size.dart';

class FormHeader {
  static largeTitle(String input) {
    return Text(input,
        style: TextStyle(
            color: RoofUIColor.neutralColorG,
            fontSize: RoofUIFontSize.xxLarge,
            fontWeight: RoofUIFontWeight.extraThick));
  }
  static smallTitle(String input) {
    return Text(input,
        style: TextStyle(
            color: RoofUIColor.neutralColorG,
            fontSize: RoofUIFontSize.xLarge,
            fontWeight: RoofUIFontWeight.extraThick));
  }
  static subtitle(String input) {
    return Text(input,
        style: TextStyle(
            color: RoofUIColor.neutralColorG,
            fontSize: RoofUIFontSize.medium,
            fontWeight: RoofUIFontWeight.thin));
  }
}
