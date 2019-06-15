import 'package:flutter/material.dart';
import 'package:standard_icon_library/index.dart';

import '_components/title.dart';
import '_components/nav_bar.dart';

mixin TitledIconNavBarBuilder {
  String get title => null;
  StandardIcon get titleIcon => null;

  List<Widget> buildActionButtons(BuildContext context);
  Widget buildNavButton(BuildContext context);

  RoofNavBar buildTitledIconNavBar(BuildContext context) {
    return RoofTitleNavBar(
      actionButtons: buildActionButtons(context),
      title: title,
      icon: titleIcon,
      navButton: buildNavButton(context),
    );
  }
}
