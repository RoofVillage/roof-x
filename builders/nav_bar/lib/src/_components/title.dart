import 'package:flutter/material.dart';

import 'package:theme/index.dart';
import 'package:icon_library/index.dart';
import 'package:distance/index.dart' as distance;
import 'package:typography/index.dart' as typography;

import 'nav_bar.dart';
import '_widgets/nav_title_baseline.dart';

class RoofTitleNavBar extends StatelessWidget with RoofNavBar {
  final List<Widget> actionButtons;
  final Widget navButton;
  final String title;
  final StandardIconReference icon;

  RoofTitleNavBar({
    Key key,
    this.navButton,
    this.title,
    this.actionButtons,
    this.icon,
  });

  final _typographyStyle = typography.heading1;

  @override
  List<Widget> buildNavigationWidgets(BuildContext context) {
    final theme = RoofTheme.of(context);

    List<Widget> navigationWidgets = [];

    if (navButton != null) {
      navigationWidgets.add(navButton);
    }

    if (icon != null) {
      final paddedIconWidget = Container(
        margin: EdgeInsets.only(right: distance.b),
        child: icon.buildWidget(color: theme.color.icon.logo),
      );
      navigationWidgets.add(paddedIconWidget);
    }

    if (title != null) {
      final text = Text(
        title,
        style: _typographyStyle.textStyleWithColor(theme.color.text.brand),
        overflow: TextOverflow.ellipsis,
      );
      navigationWidgets.add(NavTitleBaseline(text: text));
    }

    return navigationWidgets;
  }
}
