import 'package:flutter/material.dart';
import 'package:nav_button_builder/index.dart';

import 'nav_bar.dart';

class RoofFullLogoNavBar extends StatelessWidget
    with RoofNavBar, FullLogoNavButtonBuilder {
  final List<Widget> actionButtons;
  final Function(BuildContext) onLogoTap;

  @override
  List<Widget> buildNavigationWidgets(BuildContext context) {
    return [buildFullLogoNavButton(context, onTap: onLogoTap)];
  }

  RoofFullLogoNavBar({Key key, this.actionButtons, this.onLogoTap});
}
