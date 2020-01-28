import 'package:semantic_theme/index.dart';
import 'package:semantic_theme/src/_utils/theme_option_dependent.dart';

abstract class SemanticThemeData<T> extends ThemeOptionDependent<T> {
  SemanticThemeData(T themeOption) : super(themeOption);

  SemanticThemeData<T> forThemeOption(T option);

  SemanticColorLibrary get color;
  SemanticCurveLibrary get curve;
  SemanticDistanceLibrary get distance;
  SemanticDurationLibrary get duration;
  SemanticRadiusLibrary get radius;
  SemanticShadowLibrary get shadow;
  SemanticTypographyLibrary get typography;
  SemanticSystemUiStyle get systemUiStyle;
}
