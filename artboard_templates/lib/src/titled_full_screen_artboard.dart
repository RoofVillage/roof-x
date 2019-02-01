import 'package:flutter/material.dart';
import 'package:navigation_components/index.dart';

import 'widgets/index.dart';

import 'full_screen_artboard.dart';

abstract class TitledFullScreenArtboard extends FullScreenArtboard {
  WidgetBuilder get buildBody;
  List<RoofNavButton> get actionButtons;
  RoofNavButton get navButton => null;
  String get title => null;

  RoofNavBar get _navBar {
    return RoofTitleNavBar(
        actionButtons: actionButtons, title: title, navButton: navButton);
  }

  @override
  Widget buildChild(BuildContext context) {
    return FullScreenWithNav(navBar: _navBar, body: buildBody(context));
  }
}
