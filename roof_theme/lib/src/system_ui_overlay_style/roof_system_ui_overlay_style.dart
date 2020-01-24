import 'package:flutter/services.dart';
import 'package:semantic_theme/index.dart';
import '../roof_theme_option.dart';

class RoofSystemUiOverlayStyle extends SemanticSystemUiOverlayStyle {
  RoofSystemUiOverlayStyle(currentThemeOption) : super(currentThemeOption);

  @override
  SystemUiOverlayStyle get value => forThemeOption({
        RoofThemeOption.light: SystemUiOverlayStyle.dark,
        RoofThemeOption.dark: SystemUiOverlayStyle.light,
      });
}
