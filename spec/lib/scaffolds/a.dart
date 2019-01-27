import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';

import 'package:spec/nav_bars/index.dart';
import 'package:spec/nav_buttons/index.dart';
import 'package:spec/theme/index.dart';

class RoofScaffoldA extends StatelessWidget {
  final NavigationIconReference centerIconReference;
  final NavigationIconReference leftButtonIconReference;
  final NavigationIconReference rightButtonIconReference;
  final Function rightButtonAction;
  final Function leftButtonAction;
  final Widget body;

  const RoofScaffoldA(
      {Key key,
      this.body,
      this.centerIconReference,
      this.leftButtonIconReference,
      this.rightButtonIconReference,
      this.rightButtonAction,
      this.leftButtonAction})
      : super(key: key);
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
            RoofNavBarA(
                centerIconReference: centerIconReference,
                leftButton: RoofNavButton(
                    iconReference: leftButtonIconReference,
                    onTap: leftButtonAction),
                rightButton: RoofNavButton(
                    iconReference: rightButtonIconReference,
                    onTap: rightButtonAction)),
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
