import 'package:flutter/material.dart';
import 'package:spec/color.dart';

abstract class RoofCompositionField {
  TextStyle hintStyle() {
    return TextStyle(color: RoofColor.neutralColorD);
  }

  TextStyle labelStyle() {
    return TextStyle(color: RoofColor.neutralColorG);
  }

  BorderSide enabledBorderSide() {
    return BorderSide(color: RoofColor.neutralColorD);
  }

  BorderSide focusedBorderSide() {
    return BorderSide(color: RoofColor.neutralColorF);
  }
}
