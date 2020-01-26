import 'package:semantic_theme/src/_utils/theme_option_dependent.dart';
import 'package:semantic_theme/src/system_ui_overlay_style/keyboard_brightness.dart';
import 'package:semantic_theme/src/system_ui_overlay_style/system_ui_overlay_style.dart';

abstract class SemanticSystemUiStyle<T> extends ThemeOptionDependent<T> {
  SemanticSystemUiStyle(T currentThemeOption)
      : super(currentThemeOption);

  SemanticSystemUiOverlayStyle get systemUiOverlayStyle;
  SemanticKeyboardBrightness get keyboardBrightness;
}
