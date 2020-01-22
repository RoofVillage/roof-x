import 'package:semantic_theme/index.dart';

import '_semantic_colors/index.dart';

class RoofColorLibrary extends ColorLibrary {
  final ThemeOption currentThemeOption;
  RoofColorLibrary(this.currentThemeOption);

  @override
  SemanticBackgroundColor get background =>
      RoofBackgroundColor(currentThemeOption);

  @override
  SemanticIconColor get icon => RoofIconColor(currentThemeOption);

  @override
  SemanticStrokeColor get stroke => RoofStrokeColor(currentThemeOption);

  @override
  SemanticTextColor get text => RoofTextColor(currentThemeOption);
}
