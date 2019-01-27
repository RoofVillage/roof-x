import 'package:flutter/material.dart';

import 'package:spec/nav_buttons/index.dart';
import 'package:spec/theme/index.dart';
import 'package:spec/typography/index.dart';

import 'nav_bar.dart';
import 'widgets/index.dart';

class RoofLogoNavBar extends RoofNavBar {
  final List<RoofNavButton> actionButtons;
  final String title;

  final _typographyStyle = RoofTypography.heading1;

  @override
  List<RoofNavButton> actionButtonWidgetsForTheme(RoofInheritedTheme theme) {
    return actionButtons;
  }

  @override
  List<Widget> navigationWidgetsForTheme(RoofInheritedTheme theme) {
    List<Widget> navigationWidgets = [RoofLogoNavButton()];
    if (title != null) {
      final text = Text(title,
          style: _typographyStyle.textStyleWithColor(theme.color.text.brand));
      navigationWidgets.add(NavTitleBaseline(text: text));
    }

    return navigationWidgets;
  }

  RoofLogoNavBar({Key key, this.title, this.actionButtons});
}
