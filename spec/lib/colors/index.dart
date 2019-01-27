import 'package:flutter/material.dart';
import 'package:spec/theme/option.dart';

import '_background.dart';
import '_icon.dart';
import '_stroke.dart';
import '_text.dart';

class RoofSemanticColor {
  final RoofThemeOption _current;
  RoofThemeOption get current => _current;

  final RoofStrokeColor stroke;
  final RoofBackgroundColor background;
  final RoofTextColor text;
  final RoofIconColor icon;

  RoofSemanticColor({@required RoofThemeOption current})
      : this._current = current,
        stroke = RoofStrokeColor(current),
        background = RoofBackgroundColor(current),
        text = RoofTextColor(current),
        icon = RoofIconColor(current);
}
