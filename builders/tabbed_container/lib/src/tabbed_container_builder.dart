import 'package:flutter/material.dart';
import 'package:tab/index.dart';

import 'tabbed_container.dart';

mixin RoofTabbedContainerBuilder {
  RoofTabbedContainer buildTabbedContainer(
    BuildContext context,
    List<RoofTab> tabs,
  ) {
    return RoofTabbedContainer(tabs: tabs);
  }
}
