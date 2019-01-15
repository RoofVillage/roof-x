import 'package:flutter/material.dart';
import 'package:roofui_kit/util/roofui_distance.dart';

class FormStyle {
  static EdgeInsets formHeaderMargin() {
    return EdgeInsets.fromLTRB(0, RoofUIDistance.c, 0, RoofUIDistance.c);
  }
  static EdgeInsets formMargin() {
    return EdgeInsets.fromLTRB(
        RoofUIDistance.c, RoofUIDistance.b, RoofUIDistance.c, RoofUIDistance.b);
  }
}
