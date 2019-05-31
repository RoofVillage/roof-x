import 'package:flutter/material.dart';

import 'tabbed_container.dart';
import 'tab.dart';

mixin RoofTabbedContainerBuilder {
  RoofTabbedContainer buildTabbedContainer(
    BuildContext context,
    List<RoofTab> tabs, {
    Function(bool) dockVisibilityListener,
  }) {
    return RoofTabbedContainer(
      tabs: tabs,
      dockVisibilityListener: dockVisibilityListener,
    );
  }
}
