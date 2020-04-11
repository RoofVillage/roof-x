import 'dart:ui';

import 'package:roof_theme/index.dart';
import 'package:semantic_theme/index.dart';

import '../_constants/_font_family.dart' as ff;
import '../_constants/_font_size.dart' as fs;
import '../_constants/_font_weight.dart' as fw;

class RoofButtonTypography extends SemanticTypography {
  RoofButtonTypography(currentThemeOption) : super(currentThemeOption);

  @override
  String get fontFamily => ff.azo;

  @override
  List<String> get fontFamilyFallback => null;

  @override
  double get fontSize => fs.medium;

  @override
  FontWeight get fontWeight => forThemeOption({
        RoofThemeOption.light: fw.thick,
        RoofThemeOption.dark: fw.medium,
      });

  @override
  double get letterSpacing => null;
}
