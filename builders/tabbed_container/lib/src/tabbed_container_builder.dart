import 'package:flutter/material.dart';

import 'tabbed_container.dart';
import 'tab.dart';

mixin RoofTabbedContainerBuilder {
  RoofTabbedContainer buildTabbedContainer(
    BuildContext context,
    List<RoofTab> tabs,
  ) {
    return RoofTabbedContainer(tabs: tabs);
  }
}
