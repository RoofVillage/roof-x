import 'package:flutter/material.dart';

import 'inherited_scroll_controller_provider.dart';

class InheritedScrollController {
  static ScrollController of(BuildContext context) {
    final inheritedWidget = context
        .dependOnInheritedWidgetOfExactType<ScrollControllerInheritedWidget>();

    return inheritedWidget?.scrollController;
  }
}
