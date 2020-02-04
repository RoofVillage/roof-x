import 'package:semantic_theme/index.dart';
import 'package:semantic_theme/src/_utils/theme_option_dependent.dart';

abstract class SemanticThemeData<T> extends ThemeOptionDependent<T> {
  SemanticThemeData(T themeOption) : super(themeOption);

  /// Method called to initialize `SemanticThemeData<T>` with `T themeOption`.
  SemanticThemeData<T> build(T themeOption);

  /// Called each time theme option is changed.
  /// This method can be overridden to store a new theme option preference to the device.
  void themeOptionDidChange(T newThemeOption) => null;

  /// Called when the SemanticTheme is initialized.
  /// This method can be overridden to return a stored theme option preference.
  Future<T> loadThemeOption() => null;

  SemanticColorLibrary get color;
  SemanticCurveLibrary get curve;
  SemanticDistanceLibrary get distance;
  SemanticDurationLibrary get duration;
  SemanticRadiusLibrary get radius;
  SemanticShadowLibrary get shadow;
  SemanticTypographyLibrary get typography;
  SemanticSystemUiStyle get systemUiStyle;
  SemanticLogoLibrary get logo;
}
