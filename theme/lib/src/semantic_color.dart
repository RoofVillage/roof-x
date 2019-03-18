import 'package:flutter/material.dart';

import '_background.dart';
import '_border.dart';
import '_icon.dart';
import '_stroke.dart';
import '_text.dart';

import 'option.dart';

class RoofSemanticColor {
  final RoofThemeOption _current;
  RoofThemeOption get current => _current;

  final RoofStrokeColor stroke;
  final RoofBackgroundColor background;
  final RoofBorderColor border;
  final RoofTextColor text;
  final RoofIconColor icon;

  RoofSemanticColor({@required RoofThemeOption current})
      : this._current = current,
        stroke = RoofStrokeColor(current),
        background = RoofBackgroundColor(current),
        border = RoofBorderColor(current),
        text = RoofTextColor(current),
        icon = RoofIconColor(current);
}
