import 'package:semantic_theme/index.dart';
import 'package:sm_theme/src/system_ui_style/_keyboard_brightness.dart';
import 'package:sm_theme/src/system_ui_style/_ui_overlay_style.dart';

class SmSystemUiStyle extends SemanticSystemUiStyle {
  SmSystemUiStyle(currentThemeOption) : super(currentThemeOption);

  @override
  SemanticKeyboardBrightness get keyboardBrightness =>
      SmKeyboardBrightness(currentThemeOption);

  @override
  SemanticSystemUiOverlayStyle get systemUiOverlayStyle =>
      SmSystemUiOverlayStyle(currentThemeOption);
}
