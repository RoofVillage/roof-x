import 'package:flutter/services.dart';
import 'package:semantic_theme/index.dart';
import 'package:sm_theme/index.dart';

class SmSystemUiOverlayStyle extends SemanticSystemUiOverlayStyle {
  SmSystemUiOverlayStyle(currentThemeOption) : super(currentThemeOption);

  @override
  SystemUiOverlayStyle get value => forThemeOption({
        SmThemeOption.dark: SystemUiOverlayStyle.light,
      });
}
