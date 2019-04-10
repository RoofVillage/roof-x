import 'package:flutter/material.dart';

import 'package:theme/index.dart';
import 'package:typography/index.dart' as typography;

import 'nav_bar.dart';
import '_widgets/nav_title_baseline.dart';

class RoofTitleNavBar extends StatelessWidget with RoofNavBar {
  final List<Widget> actionButtons;
  final Widget navButton;
  final String title;

  final _typographyStyle = typography.heading1;

  @override
  List<Widget> buildNavigationWidgets(BuildContext context) {
    final theme = RoofTheme.of(context);
    List<Widget> navigationWidgets = [];
    if (navButton != null) {
      navigationWidgets.add(navButton);
    }
    if (title != null) {
      final text = Text(title,
          style: _typographyStyle.textStyleWithColor(theme.color.text.brand));
      navigationWidgets.add(NavTitleBaseline(text: text));
    }

    return navigationWidgets;
  }

  RoofTitleNavBar({Key key, this.navButton, this.title, this.actionButtons});
}
