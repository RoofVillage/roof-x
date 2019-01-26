import 'package:flutter/material.dart';
import 'distance.dart';

class RoofObjectPadding {
  static EdgeInsets get field1 {
    return EdgeInsets.fromLTRB(
        RoofDistance.b, RoofDistance.d, RoofDistance.b, RoofDistance.d);
  }

  static EdgeInsets get field2 {
    return EdgeInsets.fromLTRB(
        RoofDistance.b, RoofDistance.a, RoofDistance.b, RoofDistance.c);
  }

  static EdgeInsets get container1 {
    return EdgeInsets.fromLTRB(
        RoofDistance.c, RoofDistance.c, RoofDistance.c, RoofDistance.c);
  }
}
