import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

import '../sm_theme_option.dart';

class SmShadowLibrary extends SemanticShadowLibrary {
  SmShadowLibrary(currentThemeOption) : super(currentThemeOption);

  @override
  BoxShadow get small => forThemeOption({
        SmThemeOption.dark: BoxShadow(
          blurRadius: 6,
          color: Colors.black.withOpacity(.25),
          offset: Offset(0, 0),
        ),
      });

  @override
  BoxShadow get medium => forThemeOption({
        SmThemeOption.dark: BoxShadow(
          blurRadius: 12,
          color: Colors.black.withOpacity(.25),
          offset: Offset(0, 0),
        ),
      });

  @override
  BoxShadow get large => forThemeOption({
        SmThemeOption.dark: BoxShadow(
          blurRadius: 18,
          color: Colors.black.withOpacity(.35),
          offset: Offset(0, 2),
        ),
      });

  @override
  BoxShadow get appBar => forThemeOption({
        SmThemeOption.dark: BoxShadow(
          blurRadius: 18,
          color: Colors.black.withOpacity(.35),
          offset: Offset(0, 2),
        ),
      });

  @override
  BoxShadow get card => forThemeOption({
        SmThemeOption.dark: BoxShadow(
          blurRadius: 3,
          color: Colors.black.withOpacity(.35),
          offset: Offset(0, 1),
        ),
      });
}
