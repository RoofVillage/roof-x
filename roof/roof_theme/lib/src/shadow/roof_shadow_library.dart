import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

import '../roof_theme_option.dart';

class RoofShadowLibrary extends SemanticShadowLibrary {
  RoofShadowLibrary(currentThemeOption) : super(currentThemeOption);

  @override
  BoxShadow get small => forThemeOption({
        RoofThemeOption.light: BoxShadow(
          blurRadius: 8,
          color: Colors.black.withOpacity(.2),
          offset: Offset(0, 3),
        ),
        RoofThemeOption.dark: BoxShadow(
          blurRadius: 8,
          color: Colors.black.withOpacity(.1),
          offset: Offset(0, 3),
        ),
      });

  @override
  BoxShadow get medium => forThemeOption({
        RoofThemeOption.light: BoxShadow(
          blurRadius: 12,
          color: Colors.black.withOpacity(.2),
          offset: Offset(0, 5),
        ),
        RoofThemeOption.dark: BoxShadow(
          blurRadius: 12,
          color: Colors.black.withOpacity(.9),
          offset: Offset(0, 5),
        ),
      });

  @override
  BoxShadow get large => forThemeOption({
        RoofThemeOption.light: BoxShadow(
          blurRadius: 16,
          color: Colors.black.withOpacity(.2),
          offset: Offset(0, 7),
        ),
        RoofThemeOption.dark: BoxShadow(
          blurRadius: 16,
          color: Colors.black.withOpacity(.5),
          offset: Offset(0, 7),
        ),
      });
}
