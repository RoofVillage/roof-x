import 'package:roof_theme/index.dart';
import 'package:roof_theme/src/_constants/_theme_option_key.dart';
import 'package:cache/index.dart';
import 'package:roof_theme/src/logo/roof_logo_library.dart';
import 'package:semantic_theme/index.dart';
import 'package:roof_theme/src/color/roof_color_library.dart';
import 'package:roof_theme/src/curve/roof_curve_library.dart';
import 'package:roof_theme/src/duration/roof_duration_library.dart';
import 'package:roof_theme/src/distance/roof_distance_library.dart';
import 'package:roof_theme/src/radius/roof_radius_library.dart';
import 'package:roof_theme/src/roof_theme_option.dart';
import 'package:roof_theme/src/shadow/roof_shadow_library.dart';
import 'package:roof_theme/src/system_ui_style/roof_system_ui_style.dart';
import 'package:roof_theme/src/typography/roof_typography_library.dart';

class RoofSemanticTheme extends SemanticThemeData<RoofThemeOption> {
  RoofSemanticTheme(RoofThemeOption themeOption) : super(themeOption);

  @override
  SemanticThemeData<RoofThemeOption> build(RoofThemeOption option) {
    return RoofSemanticTheme(option);
  }

  @override
  Future<RoofThemeOption> loadThemeOption() async {
    final String key = await stringForKey(themeOptionKey);

    for (RoofThemeOption option in RoofThemeOption.values) {
      if (key == option.toString()) return option;
    }
    return currentThemeOption;
  }

  @override
  void themeOptionDidChange(RoofThemeOption themeOption) {
    String string;

    switch (themeOption) {
      case RoofThemeOption.light:
        string = RoofThemeOption.light.toString();
        break;
      case RoofThemeOption.dark:
        string = RoofThemeOption.dark.toString();
        break;
    }

    saveString(
      key: themeOptionKey,
      string: string,
    );
  }

  @override
  SemanticColorLibrary get color => RoofColorLibrary(currentThemeOption);

  @override
  SemanticCurveLibrary get curve => RoofCurveLibrary();

  @override
  SemanticDistanceLibrary get distance => RoofDistanceLibrary();

  @override
  SemanticDurationLibrary get duration => RoofDurationLibrary();

  @override
  SemanticRadiusLibrary get radius => RoofRadiusLibrary();

  @override
  SemanticShadowLibrary get shadow => RoofShadowLibrary(currentThemeOption);

  @override
  SemanticTypographyLibrary get typography =>
      RoofTypographyLibrary(currentThemeOption);

  @override
  SemanticSystemUiStyle get systemUiStyle =>
      RoofSystemUiStyle(currentThemeOption);

  @override
  SemanticLogoLibrary get logo => RoofLogoLibrary(currentThemeOption);
}
