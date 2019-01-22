import 'package:flutter/material.dart';
import 'distance.dart';

class RoofObjectPadding {
  static EdgeInsets fieldPaddingA() {
    return EdgeInsets.fromLTRB(RoofDistance.b, RoofDistance.d, RoofDistance.b, RoofDistance.d);
  }
  static EdgeInsets fieldPaddingB() {
    return EdgeInsets.fromLTRB(RoofDistance.b, RoofDistance.a, RoofDistance.b, RoofDistance.c);
  }
  static EdgeInsets containerPaddingA() {
    return EdgeInsets.fromLTRB(RoofDistance.c, RoofDistance.c, RoofDistance.c, RoofDistance.c);
  }
}