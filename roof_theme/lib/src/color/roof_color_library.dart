import 'package:semantic_theme/index.dart';
import 'package:roof_theme/src/roof_theme_option.dart';

import '_semantic_colors/index.dart';

class RoofColorLibrary extends SemanticColorLibrary<RoofThemeOption> {
  RoofColorLibrary(RoofThemeOption currentThemeOption)
      : super(currentThemeOption);

  @override
  SemanticBackgroundColor<RoofThemeOption> get background =>
      RoofBackgroundColor(currentThemeOption);

  @override
  SemanticIconColor<RoofThemeOption> get icon =>
      RoofIconColor(currentThemeOption);

  @override
  SemanticStrokeColor<RoofThemeOption> get stroke =>
      RoofStrokeColor(currentThemeOption);

  @override
  SemanticTextColor<RoofThemeOption> get text =>
      RoofTextColor(currentThemeOption);
}
