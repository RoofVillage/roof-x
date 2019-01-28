import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart';

import '../buttons/index.dart';
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
    var navigationWidgets = <Widget>[RoofLogoNavButton()];
    if (title != null) {
      final text = Text(title,
          style: _typographyStyle.textStyleWithColor(theme.color.text.brand));
      navigationWidgets.add(NavTitleBaseline(text: text));
    }

    return navigationWidgets;
  }

  RoofLogoNavBar({Key key, this.title, this.actionButtons});
}
