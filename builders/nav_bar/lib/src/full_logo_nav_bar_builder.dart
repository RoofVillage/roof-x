import 'package:flutter/material.dart';

import 'components/index.dart';

mixin FullLogoNavBarBuilder {
  List<Widget> buildActionButtons(BuildContext context);

  RoofNavBar buildFullLogoNavBar(BuildContext context) {
    return RoofFullLogoNavBar(actionButtons: buildActionButtons(context));
  }
}
