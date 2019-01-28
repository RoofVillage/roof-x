import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:theme/index.dart';

import 'nav_button.dart';

class RoofLogoNavButton extends RoofNavButton {
  final BuildContextPasser _onTap;

  @override
  void onTap(BuildContext context) => _onTap(context);

  @override
  Widget iconForTheme(RoofInheritedTheme theme) {
    return IconReference.info.buildSvg(color: theme.color.icon.logo);
  }

  RoofLogoNavButton({BuildContextPasser onTap}) : _onTap = onTap;
}
