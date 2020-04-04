import 'package:flutter/material.dart';

abstract class SemanticCurveLibrary {
  Curve get normal => Curves.easeOut;
  Curve get hurried => Curves.easeOutCirc;
  Curve get delayed => Curves.easeInQuad;
  Curve get enter => Curves.easeOutQuart;
  Curve get exit => Curves.easeInQuart;
}
