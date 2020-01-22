import 'package:flutter/material.dart';

abstract class CurveLibrary {
  Curve get normal => Curves.linearToEaseOut;
  Curve get hurried => Curves.easeOutCirc;
  Curve get delayed => Curves.easeInCirc;
  Curve get enter => Curves.easeInQuad;
  Curve get exit => Curves.easeInQuad;
}
