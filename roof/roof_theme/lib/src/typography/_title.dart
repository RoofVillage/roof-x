import 'dart:ui';

import 'package:semantic_theme/index.dart';

import '../_constants/_font_family.dart' as ff;
import '../_constants/_font_size.dart' as fs;
import '../_constants/_font_weight.dart' as fw;
import 'package:roof_theme/index.dart';

class RoofTitleTypography extends SemanticTypography {
  RoofTitleTypography(currentThemeOption) : super(currentThemeOption);

  @override
  String get fontFamily => ff.azo;

  @override
  List<String> get fontFamilyFallback => null;

  @override
  double get fontSize => fs.large;

  @override
  FontWeight get fontWeight => forThemeOption({
        RoofThemeOption.light: fw.thick,
        RoofThemeOption.dark: fw.medium,
      });

  @override
  double get letterSpacing => null;
}
