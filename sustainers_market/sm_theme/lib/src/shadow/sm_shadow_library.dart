import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

import '../sm_theme_option.dart';

class SmShadowLibrary extends SemanticShadowLibrary {
  SmShadowLibrary(currentThemeOption) : super(currentThemeOption);

  @override
  BoxShadow get small => forThemeOption({
        SmThemeOption.dark: BoxShadow(
          blurRadius: 8,
          color: Colors.black.withOpacity(.2),
          offset: Offset(0, 3),
        ),
      });

  @override
  BoxShadow get medium => forThemeOption({
        SmThemeOption.dark: BoxShadow(
          blurRadius: 12,
          color: Colors.black.withOpacity(.2),
          offset: Offset(0, 5),
        ),
      });

  @override
  BoxShadow get large => forThemeOption({
        SmThemeOption.dark: BoxShadow(
          blurRadius: 16,
          color: Colors.black.withOpacity(.2),
          offset: Offset(0, 7),
        ),
      });
}
