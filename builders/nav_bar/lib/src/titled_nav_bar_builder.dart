import 'package:flutter/material.dart';

import '_components/title.dart';
import '_components/nav_bar.dart';

mixin TitledNavBarBuilder {
  String get title => null;

  List<Widget> buildActionButtons(BuildContext context);
  Widget buildNavButton(BuildContext context);

  RoofNavBar buildTitledNavBar(BuildContext context) {
    return RoofTitleNavBar(
        actionButtons: buildActionButtons(context),
        title: title,
        navButton: buildNavButton(context));
  }
}
