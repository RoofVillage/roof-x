import 'package:flutter/material.dart';
import 'package:spec/color.dart';

abstract class RoofCompositionField {
  InputDecoration decoration({String fieldName, String placeholder}) {
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
}
