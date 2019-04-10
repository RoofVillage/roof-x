import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:theme/index.dart';
import 'package:typedefs/index.dart';

import 'nav_button.dart';

class RoofLogoNavButton extends StatelessWidget with RoofNavButton {
  final ContextPasser onTap;

  @override
  Widget iconForTheme(RoofInheritedTheme theme) {
    return IconReference.logoHouse.buildSvg(color: theme.color.icon.logo);
  }

  RoofLogoNavButton({@required this.onTap});
}
