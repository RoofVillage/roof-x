import 'package:flutter/material.dart';
import 'package:navigation_components/index.dart';
import 'package:table_artboard_mixin/index.dart';

import 'widgets/index.dart';

import 'full_screen_artboard.dart';

abstract class TitledFullTableScreenArtboard extends FullScreenArtboard
    with TableArtboard {
  List<RoofNavButton> get actionButtons;
  RoofNavButton get navButton => null;
  String get title => null;

  RoofNavBar get _navBar {
    return RoofTitleNavBar(
        actionButtons: actionButtons, title: title, navButton: navButton);
  }

  @override
  Widget buildBody(BuildContext context) {
    return FullScreenWithNav(navBar: _navBar, body: buildTable(context));
  }
}
