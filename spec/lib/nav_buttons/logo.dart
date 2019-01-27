import 'package:flutter/material.dart';

import 'package:icon_library/index.dart';
import 'package:spec/theme/index.dart';

import 'nav_button.dart';

class RoofLogoNavButton extends RoofNavButton {
  final Function _onTap;

  @override
  Function onTap() => _onTap;

  @override
  Widget iconForTheme(RoofInheritedTheme theme) {
    return IconReference.info.buildSvg(color: theme.color.icon.logo);
  }

  RoofLogoNavButton({Function onTap}) : _onTap = onTap;
}
