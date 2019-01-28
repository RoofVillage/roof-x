import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:theme/index.dart';

import 'nav_button.dart';

class RoofFullLogoNavButton extends RoofNavButton {
  final BuildContextPasser _onTap;

  @override
  BuildContextPasser onTap(BuildContext context) => _onTap(context);

  @override
  Widget iconForTheme(RoofInheritedTheme theme) {
    return IconReference.logoFull.buildSvg(color: theme.color.icon.logo);
  }

  RoofFullLogoNavButton({BuildContextPasser onTap}) : _onTap = onTap;
}
