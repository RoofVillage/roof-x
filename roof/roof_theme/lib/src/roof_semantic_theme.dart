import 'package:roof_theme/index.dart';
import 'package:roof_theme/src/_constants/_theme_option_key.dart';
import 'package:cache/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:roof_theme/src/color/roof_color_library.dart';
import 'package:roof_theme/src/curve/roof_curve_library.dart';
import 'package:roof_theme/src/duration/roof_duration_library.dart';
import 'package:roof_theme/src/distance/roof_distance_library.dart';
import 'package:roof_theme/src/radius/roof_duration_library.dart';
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

    switch (key) {
      case "light":
        return RoofThemeOption.light;
      case "dark":
        return RoofThemeOption.dark;
      default:
        return currentThemeOption;
    }
  }

  @override
  void themeOptionDidChange(RoofThemeOption themeOption) {
    saveString(
      key: themeOptionKey,
      string: themeOption.toString(),
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
  SemanticTypographyLibrary get typography => RoofTypographyLibrary();

  @override
  SemanticSystemUiStyle get systemUiStyle =>
      RoofSystemUiStyle(currentThemeOption);
}
