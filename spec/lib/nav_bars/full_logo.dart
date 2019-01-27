import 'package:flutter/material.dart';

import 'package:spec/nav_buttons/index.dart';
import 'package:spec/theme/index.dart';

import 'nav_bar.dart';

class RoofFullLogoNavBar extends RoofNavBar {
  final List<RoofNavButton> actionButtons;

  @override
  List<RoofNavButton> actionButtonWidgetsForTheme(RoofInheritedTheme theme) {
    return actionButtons;
  }

  @override
  List<Widget> navigationWidgetsForTheme(RoofInheritedTheme theme) {
    return [RoofFullLogoNavButton()];
  }

  RoofFullLogoNavBar({Key key, this.actionButtons});
}
