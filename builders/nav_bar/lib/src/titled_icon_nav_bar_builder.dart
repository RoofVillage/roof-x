import 'package:flutter/material.dart';
import 'package:standard_icon_library/index.dart';

import '_components/title_nav_bar.dart';
import '_components/nav_bar.dart';

mixin TitledIconNavBarBuilder {
  NavBar buildTitledIconNavBar(
    BuildContext context, {
    String title,
    String subtitle,
    StandardIcon titleIcon,
    List<Widget> actionButtons,
    Widget navButton,
  }) {
    return TitleNavBar(
      actionButtons: actionButtons,
      title: title,
      subtitle: subtitle,
      icon: titleIcon,
      navButton: navButton,
    );
  }
}
