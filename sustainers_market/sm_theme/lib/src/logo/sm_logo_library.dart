import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

class SmLogoLibrary extends SemanticLogoLibrary {
  SmLogoLibrary(currentThemeOption) : super(currentThemeOption);

  @override
  Widget get full => Container(
        width: 90,
        height: 30,
        color: Colors.pink,
      );

  @override
  Widget get icon => Container(
        width: 30,
        height: 30,
        color: Colors.pink,
      );
}
