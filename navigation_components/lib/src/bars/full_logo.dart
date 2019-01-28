import 'package:flutter/material.dart';
import 'package:theme/index.dart';

import '../buttons/index.dart';
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
