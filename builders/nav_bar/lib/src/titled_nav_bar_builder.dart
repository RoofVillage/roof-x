import 'package:flutter/material.dart';

import 'components/index.dart';

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
