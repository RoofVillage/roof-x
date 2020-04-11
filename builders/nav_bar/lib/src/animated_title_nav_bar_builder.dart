import 'package:flutter/material.dart';

import '_components/animated_title_nav_bar.dart';

mixin AnimatedTitleNavBarBuilder {
  AnimatedTitleNavBar buildAnimatedTitleNavBar({
    String title,
    ScrollController scrollController,
    Widget navButton,
    List<Widget> actionButtons,
    bool hideOnScroll,
  }) =>
      AnimatedTitleNavBar(
        scrollController: scrollController,
        title: title,
        navButton: navButton,
        actionButtons: actionButtons,
        hideOnScroll: hideOnScroll,
      );
}
