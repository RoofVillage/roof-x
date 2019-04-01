import 'package:flutter/material.dart';

import 'components/index.dart';

mixin FullLogoNavBarBuilder {
  List<RoofNavButton> get actionButtons;

  RoofNavBar buildFullLogoNavBar(BuildContext context) {
    return RoofFullLogoNavBar(actionButtons: actionButtons);
  }
}
