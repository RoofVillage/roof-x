import 'package:flutter/material.dart';

import 'components/index.dart';

mixin TitledNavBarBuilder {
  List<RoofNavButton> get actionButtons;
  RoofNavButton get navButton => null;
  String get title => null;

  RoofNavBar buildTitledNavBar(BuildContext context) {
    return RoofTitleNavBar(
        actionButtons: actionButtons, title: title, navButton: navButton);
  }
}
