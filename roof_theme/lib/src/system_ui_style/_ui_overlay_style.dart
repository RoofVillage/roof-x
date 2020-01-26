import 'package:flutter/services.dart';
import 'package:semantic_theme/index.dart';
import 'package:theme/index.dart';

class RoofSystemUiOverlayStyle extends SemanticSystemUiOverlayStyle {
  RoofSystemUiOverlayStyle(currentThemeOption) : super(currentThemeOption);

  @override
  SystemUiOverlayStyle get value => forThemeOption({
        RoofThemeOption.dark: SystemUiOverlayStyle.dark,
        RoofThemeOption.light: SystemUiOverlayStyle.light,
      });
}
