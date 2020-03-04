import 'package:flutter/material.dart';
import 'package:navigation_icon_library/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:svg/index.dart';
import '../_constants/_colors.dart' as colors;

class RoofLogoLibrary extends SemanticLogoLibrary {
  RoofLogoLibrary(currentThemeOption) : super(currentThemeOption);

  @override
  Widget get full => SvgReference.logoFull.buildSvg(
        color: colors.brandRed,
      );

  @override
  Widget get icon => NavigationIcon.logoHouse.buildWidget(
        color: colors.brandRed,
      );
}
