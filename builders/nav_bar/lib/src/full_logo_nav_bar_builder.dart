import 'package:flutter/material.dart';

import '_components/full_logo.dart';
import '_components/nav_bar.dart';

mixin FullLogoNavBarBuilder {
  List<Widget> buildActionButtons(BuildContext context);

  RoofNavBar buildFullLogoNavBar(BuildContext context) {
    return RoofFullLogoNavBar(actionButtons: buildActionButtons(context));
  }
}
