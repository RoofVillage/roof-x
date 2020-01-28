import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:sm_theme/src/color/sm_color_library.dart';
import 'package:sm_theme/src/curve/sm_curve_library.dart';
import 'package:sm_theme/src/distance/roof_distance_library.dart';
import 'package:sm_theme/src/duration/sm_duration_library.dart';
import 'package:sm_theme/src/radius/sm_duration_library.dart';
import 'package:sm_theme/src/shadow/sm_shadow_library.dart';
import 'package:sm_theme/src/sm_theme_option.dart';
import 'package:sm_theme/src/system_ui_style/sm_system_ui_style.dart';
import 'package:sm_theme/src/typography/sm_typography_library.dart';

class SmSemanticTheme extends SemanticTheme<SmThemeOption> {
  SmSemanticTheme(
    SmThemeOption initialThemeOption, {
    @required Widget child,
  }) : super(
          initialThemeOption,
          child: child,
        );

  @override
  SmInheritedSemanticTheme createState() => SmInheritedSemanticTheme();
}

class SmInheritedSemanticTheme extends SemanticInheritedTheme<SmThemeOption> {
  @override
  SemanticColorLibrary get color => SmColorLibrary(currentThemeOption);

  @override
  SemanticCurveLibrary get curve => SmCurveLibrary();

  @override
  SemanticDistanceLibrary get distance => SmDistanceLibrary();

  @override
  SemanticDurationLibrary get duration => SmDurationLibrary();

  @override
  SemanticRadiusLibrary get radius => SmRadiusLibrary();

  @override
  SemanticShadowLibrary get shadow => SmShadowLibrary(currentThemeOption);

  @override
  SemanticTypographyLibrary get typography => SmTypographyLibrary();

  @override
  SemanticSystemUiStyle get systemUiStyle =>
      SmSystemUiStyle(currentThemeOption);
}
