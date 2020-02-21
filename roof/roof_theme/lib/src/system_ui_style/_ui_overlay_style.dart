import 'package:flutter/services.dart';
import 'package:semantic_theme/index.dart';
import 'package:roof_theme/index.dart';

class RoofSystemUiOverlayStyle extends SemanticSystemUiOverlayStyle {
  RoofSystemUiOverlayStyle(currentThemeOption) : super(currentThemeOption);

  @override
  SystemUiOverlayStyle get value => forThemeOption({
        RoofThemeOption.dark: SystemUiOverlayStyle.light,
        RoofThemeOption.light: SystemUiOverlayStyle.dark,
      });
}
