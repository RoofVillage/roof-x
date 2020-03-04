import 'package:flutter/material.dart';

import '_components/full_logo_nav_bar.dart';
import '_components/nav_bar.dart';

mixin FullLogoNavBarBuilder {
  NavBar buildFullLogoNavBar(
    BuildContext context, {
    List<Widget> actionButtons,
  }) {
    return FullLogoNavBar(actionButtons: actionButtons);
  }
}
