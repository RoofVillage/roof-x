import 'package:flutter/material.dart';
import 'package:roofui_kit/util/roofui_color.dart';
import 'package:roofui_kit/util/roofui_distance.dart';
import 'package:roofui_kit/util/roofui_corner_radiuses.dart';

class FieldStyle {
  final String fieldNameText;
  final String placeholderText;

  const FieldStyle({this.fieldNameText, this.placeholderText});

  static InputDecoration inputDecorationA(
      {String fieldNameText, String placeholderText}) {
    return InputDecoration(
        labelText: fieldNameText,
        hintText: placeholderText,
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: RoofUIColor.neutralColorD)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: RoofUIColor.neutralColorF)),
        hintStyle: TextStyle(color: RoofUIColor.neutralColorD),
        labelStyle: TextStyle(color: RoofUIColor.neutralColorG));
  }

  static InputDecoration textAreaDecoration(
      {String fieldNameText, String placeholderText}) {
    return InputDecoration(
      labelText: fieldNameText,
      hintText: placeholderText,
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: RoofUIColor.neutralColorD), borderRadius: BorderRadius.all(RoofUICornerRadius.small)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: RoofUIColor.neutralColorF), borderRadius: BorderRadius.all(RoofUICornerRadius.small)),
      hintStyle: TextStyle(color: RoofUIColor.neutralColorD),
    );
  }

  static EdgeInsets standardFieldPadding() {
    return EdgeInsets.fromLTRB(0, RoofUIDistance.c, 0, RoofUIDistance.c);
  }
}
