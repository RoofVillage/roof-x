import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:theme/src/color/roof_color_library.dart';
import 'package:theme/src/curve/roof_curve_library.dart';
import 'package:theme/src/distance/roof_distance_library.dart';
import 'package:theme/src/duration/roof_duration_library.dart';
import 'package:theme/src/radius/roof_duration_library.dart';
import 'package:theme/src/roof_theme_option.dart';
import 'package:theme/src/shadow/roof_shadow_library.dart';

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
  SemanticDistanceLibrary get distances => RoofDistanceLibrary();

  @override
  SemanticDurationLibrary get durations => RoofDurationLibrary();

  @override
  SemanticRadiusLibrary get radiuses => RoofRadiusLibrary();

  @override
  SemanticShadowLibrary get shadows => RoofShadowLibrary(currentThemeOption);

  @override
  SemanticTypographyLibrary get typography => null;

  @override
  SemanticSystemUiOverlayStyle get uiOverlayStyle => null;
}
