import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';

import 'package:spec/nav_bars/index.dart';
import 'package:spec/nav_buttons/index.dart';
import 'package:spec/theme/index.dart';

abstract class RoofArtboard extends StatelessWidget {
  Widget get body;
  List<RoofNavButton> get actionButtons;
  RoofNavButton get navButton => null;
  String get title => null;

  RoofNavBar get navBar {
    if (navButton != null) {
      print("1");
      return RoofTitleNavBar(
          actionButtons: actionButtons, title: title, navButton: navButton);
    } else if (title != null) {
      print("2");
      return RoofLogoNavBar(actionButtons: actionButtons, title: title);
    } else {
      print("3");
      return RoofFullLogoNavBar(actionButtons: actionButtons);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    return Scaffold(
        backgroundColor: theme.color.background.general,
        body: Center(
            child: Column(
          // Stretch the cards in horizontal axis
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            navBar,
            Expanded(
                /*
              Wrap in MediaQuery to remove the top padding that the Scaffold will assume is necessary.
              See https://github.com/flutter/flutter/issues/14842
            */
                child: MediaQuery.removePadding(
                    context: context, removeTop: true, child: body))
          ],
        )));
  }
}
