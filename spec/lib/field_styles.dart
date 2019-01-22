import 'package:flutter/material.dart';
import 'color.dart';
import 'corner_radiuses.dart';
import 'font_size.dart';
import 'font_weight.dart';

class RoofFieldStyle {
  final String fieldName;
  final String placeholder;

  const RoofFieldStyle({this.fieldName, this.placeholder});

  static InputDecoration inputDecorationA(
      {String fieldName, String placeholder}) {
    return InputDecoration(
        labelText: fieldName,
        hintText: placeholder,
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: RoofColor.neutralColorD)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: RoofColor.neutralColorF)),
        hintStyle: TextStyle(color: RoofColor.neutralColorD),
        labelStyle: TextStyle(color: RoofColor.neutralColorG));
  }

  static InputDecoration textAreaDecoration(
      {String fieldName, String placeholder}) {
    return InputDecoration(
      // fillColor: RoofColor.neutralColorA,
      // filled: true,
      labelText: fieldName,
      hintText: placeholder,
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: RoofColor.neutralColorD),
          borderRadius: BorderRadius.all(RoofCornerRadius.regular)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: RoofColor.neutralColorF),
          borderRadius: BorderRadius.all(RoofCornerRadius.regular)),
      hintStyle: TextStyle(color: RoofColor.neutralColorD),
    );
  }

  static BoxDecoration dropdownContainerStyle() {
    return BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: RoofCornerRadius.small,
            bottomRight: RoofCornerRadius.small),
        color: RoofColor.neutralColorA,
        boxShadow: [
          BoxShadow(
            color: RoofColor.neutralColorE,
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ]);
  }

  static TextStyle labelStyle() {
    return TextStyle(
        fontSize: RoofFontSize.small,
        fontWeight: RoofFontWeight.thick,
        color: RoofColor.neutralColorG);
  }

  static TextStyle fieldContentTextStyle() {
    return TextStyle(
        fontSize: RoofFontSize.medium, color: RoofColor.neutralColorG);
  }
}
