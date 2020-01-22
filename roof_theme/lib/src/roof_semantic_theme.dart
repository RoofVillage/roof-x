import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:theme/src/libraries/color/roof_color_library.dart';

class RoofSemanticTheme extends SemanticTheme {
  RoofSemanticTheme(
    ThemeOption themeOption, {
    @required Widget child,
  }) : super(
          themeOption,
          child: child,
        );

  @override
  RoofInheritedSemanticTheme createState() => RoofInheritedSemanticTheme();
}

class RoofInheritedSemanticTheme extends SemanticInheritedTheme {
  @override
  ColorLibrary get colors => RoofColorLibrary(currentThemeOption);

  @override
  CurveLibrary get curves => null;

  @override
  DistanceLibrary get distances => null;

  @override
  DurationLibrary get durations => null;

  @override
  RadiusLibrary get radiuses => null;

  @override
  ShadowLibrary get shadows => null;

  @override
  TypographyLibrary get typography => null;
}
