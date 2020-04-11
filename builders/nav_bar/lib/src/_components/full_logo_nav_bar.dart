import 'package:flutter/material.dart';
import 'package:nav_button_builder/index.dart';

import 'nav_bar.dart';

class FullLogoNavBar extends StatelessWidget
    with NavBar, FullLogoNavButtonBuilder {
  final List<Widget> actionButtons;
  final void Function() onLogoTap;

  @override
  List<Widget> buildNavigationWidgets(BuildContext context) {
    return [
      buildFullLogoNavButton(
        onTap: onLogoTap,
      )
    ];
  }

  FullLogoNavBar({
    Key key,
    this.actionButtons,
    this.onLogoTap,
  });
}
