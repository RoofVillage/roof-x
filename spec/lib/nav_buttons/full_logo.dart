import 'package:flutter/material.dart';

import 'package:icon_library/index.dart';
import 'package:spec/theme/index.dart';

import 'nav_button.dart';

class RoofFullLogoNavButton extends RoofNavButton {
  final Function _onTap;

  @override
  Function onTap() => _onTap;

  @override
  Widget iconForTheme(RoofInheritedTheme theme) {
    return IconReference.logoFull.buildSvg(color: theme.color.icon.logo);
  }

  RoofFullLogoNavButton({Function onTap}) : _onTap = onTap;
}
