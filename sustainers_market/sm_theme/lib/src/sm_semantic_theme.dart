import 'package:semantic_theme/index.dart';
import 'package:sm_theme/src/_constants/_theme_option_key.dart';
import 'package:sm_theme/src/color/sm_color_library.dart';
import 'package:sm_theme/src/curve/sm_curve_library.dart';
import 'package:sm_theme/src/distance/roof_distance_library.dart';
import 'package:sm_theme/src/duration/sm_duration_library.dart';
import 'package:sm_theme/src/logo/sm_logo_library.dart';
import 'package:sm_theme/src/radius/sm_radius_library.dart';
import 'package:sm_theme/src/shadow/sm_shadow_library.dart';
import 'package:sm_theme/src/sm_theme_option.dart';
import 'package:sm_theme/src/system_ui_style/sm_system_ui_style.dart';
import 'package:sm_theme/src/typography/sm_typography_library.dart';
import 'package:cache/index.dart';

class SmSemanticTheme extends SemanticThemeData<SmThemeOption> {
  SmSemanticTheme(SmThemeOption themeOption) : super(themeOption);

  @override
  SemanticThemeData<SmThemeOption> build(SmThemeOption themeOption) {
    return SmSemanticTheme(themeOption);
  }

  @override
  Future<SmThemeOption> loadThemeOption() async {
    final String key = await stringForKey(themeOptionKey);

    switch (key) {
      case "dark":
        return SmThemeOption.dark;
      default:
        return currentThemeOption;
    }
  }

  @override
  void themeOptionDidChange(SmThemeOption newThemeOption) {
    saveString(
      key: themeOptionKey,
      string: newThemeOption.toString(),
    );
  }

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
  SemanticTypographyLibrary get typography => SmTypographyLibrary(currentThemeOption);

  @override
  SemanticSystemUiStyle get systemUiStyle =>
      SmSystemUiStyle(currentThemeOption);

  @override
  SemanticLogoLibrary get logo => SmLogoLibrary(currentThemeOption);
}
