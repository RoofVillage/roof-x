import 'package:flutter/material.dart';

import '_components/nav_header.dart';

mixin NavHeaderBuilder {
  NavHeader buildNavHeader(
    BuildContext context, {
    String title,
    Widget navButton,
    List<Widget> actionButtons,
  }) {
    return NavHeader(
      title: title,
      navButton: navButton,
      actionButtons: actionButtons,
    );
  }
}
