import 'package:flutter/material.dart';

import '../buttons/index.dart';
import 'nav_bar.dart';

class RoofFullLogoNavBar extends StatelessWidget with RoofNavBar {
  final List<RoofNavButton> actionButtons;

  @override
  List<Widget> buildNavigationWidgets(BuildContext context) {
    return [RoofFullLogoNavButton()];
  }

  RoofFullLogoNavBar({Key key, this.actionButtons});
}
