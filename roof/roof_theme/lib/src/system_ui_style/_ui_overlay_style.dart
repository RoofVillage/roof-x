import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:semantic_theme/index.dart';
import 'package:roof_theme/index.dart';

class RoofSystemUiOverlayStyle extends SemanticSystemUiOverlayStyle {
  RoofSystemUiOverlayStyle(currentThemeOption) : super(currentThemeOption);

  @override
  SystemUiOverlayStyle get value => forThemeOption({
        RoofThemeOption.dark: SystemUiOverlayStyle(
          statusBarColor: Colors.red,
          systemNavigationBarColor: Colors.yellow,
          statusBarBrightness: Brightness.light,
          systemNavigationBarDividerColor: Colors.red,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        RoofThemeOption.light: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          systemNavigationBarColor: Colors.black,
          statusBarBrightness: Brightness.dark,
        ),
      });
}
