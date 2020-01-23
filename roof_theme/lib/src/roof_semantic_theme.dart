import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:theme/src/libraries/color/roof_color_library.dart';
import 'package:theme/src/roof_theme_option.dart';

class RoofSemanticTheme extends SemanticTheme<RoofThemeOption> {
  RoofSemanticTheme(
    RoofThemeOption themeOption, {
    @required Widget child,
  }) : super(
          themeOption,
          child: child,
        );

  @override
  RoofInheritedSemanticTheme createState() => RoofInheritedSemanticTheme();
}

class RoofInheritedSemanticTheme
    extends SemanticInheritedTheme<RoofThemeOption> {
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
