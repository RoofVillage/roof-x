import 'package:flutter/material.dart';

import '_components/title_nav_bar.dart';
import '_components/nav_bar.dart';

mixin TitledNavBarBuilder {
  NavBar buildTitledNavBar(
    BuildContext context, {
    String title,
    String subtitle,
    Widget navButton,
    List<Widget> actionButtons,
  }) {
    return TitleNavBar(
      title: title,
      subtitle: subtitle,
      navButton: navButton,
      actionButtons: actionButtons,
    );
  }
}
