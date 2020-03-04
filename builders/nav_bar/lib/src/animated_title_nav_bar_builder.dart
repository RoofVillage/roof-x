import 'package:flutter/material.dart';

import '_components/animated_title_nav_bar.dart';

mixin AnimatedTitleNavBarBuilder {
  AnimatedTitleNavBar buildAnimatedTitleNavBar({
    String title,
    Widget navButton,
    List<Widget> actionButtons,
  }) =>
      AnimatedTitleNavBar(
        title: title,
        navButton: navButton,
        actionButtons: actionButtons,
      );
}
