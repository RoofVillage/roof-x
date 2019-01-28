import 'package:flutter/material.dart';
import 'package:navigation_components/index.dart';
import 'package:theme/index.dart';

import 'widgets/index.dart';

abstract class TitledFullScreenArtboard extends StatelessWidget {
  WidgetBuilder get buildBody;
  List<RoofNavButton> get actionButtons;
  RoofNavButton get navButton => null;
  String get title => null;

  RoofNavBar get _navBar {
    return RoofTitleNavBar(
        actionButtons: actionButtons, title: title, navButton: navButton);
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    final scaffold = Scaffold(
        backgroundColor: theme.color.background.general,
        body: FullScreenWithNav(navBar: _navBar, body: buildBody(context)));

    return RoofTheme(theme.current, child: scaffold);
  }
}
