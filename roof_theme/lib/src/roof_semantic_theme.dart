import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:theme/src/color/roof_color_library.dart';
import 'package:theme/src/curve/roof_curve_library.dart';
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
  SemanticColorLibrary get colors => RoofColorLibrary(currentThemeOption);

  @override
  SemanticCurveLibrary get curves => RoofCurveLibrary();

  @override
  SemanticDistanceLibrary get distances => null;

  @override
  SemanticDurationLibrary get durations => null;

  @override
  SemanticRadiusLibrary get radiuses => null;

  @override
  SemanticShadowLibrary get shadows => null;

  @override
  SemanticTypographyLibrary get typography => null;

  @override
  SemanticSystemUiOverlayStyle get uiOverlayStyle => null;
}
