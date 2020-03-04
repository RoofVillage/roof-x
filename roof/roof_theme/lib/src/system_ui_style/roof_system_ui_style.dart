import 'package:semantic_theme/index.dart';
import 'package:roof_theme/src/system_ui_style/_keyboard_brightness.dart';
import 'package:roof_theme/src/system_ui_style/_ui_overlay_style.dart';

class RoofSystemUiStyle extends SemanticSystemUiStyle {
  RoofSystemUiStyle(currentThemeOption) : super(currentThemeOption);

  @override
  SemanticKeyboardBrightness get keyboardBrightness =>
      RoofKeyboardBrightness(currentThemeOption);

  @override
  SemanticSystemUiOverlayStyle get systemUiOverlayStyle =>
      RoofSystemUiOverlayStyle(currentThemeOption);
}
