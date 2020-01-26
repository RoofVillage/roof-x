import 'package:flutter/material.dart';
import 'package:tab/index.dart';

import 'tabbed_container.dart';

mixin TabbedContainerBuilder {
  TabbedContainer buildTabbedContainer(
    BuildContext context,
    List<RoofTab> tabs,
  ) {
    return TabbedContainer(tabs: tabs);
  }
}
