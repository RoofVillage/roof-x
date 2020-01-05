import 'package:flutter/material.dart';
import 'package:svg/index.dart';
import 'package:theme/index.dart';
import 'package:typedefs/index.dart';

import 'nav_button.dart';

class RoofFullLogoNavButton extends StatelessWidget with RoofNavButton {
  final ContextPasser onTap;

  @override
  Widget iconForTheme(RoofInheritedTheme theme) {
    return SvgReference.logoFull.buildSvg(color: theme.color.icon.logo);
  }

  RoofFullLogoNavButton({@required this.onTap});
}
