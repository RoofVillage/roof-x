import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';

import '../buttons/index.dart';

abstract class RoofNavBar extends StatelessWidget {
  List<RoofNavButton> actionButtonWidgetsForTheme(RoofInheritedTheme theme);
  List<Widget> navigationWidgetsForTheme(RoofInheritedTheme theme);

  final _padding = EdgeInsets.fromLTRB(RoofDistance.a, 0, RoofDistance.a, 0);

  RoofNavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    SystemChrome.setSystemUIOverlayStyle(theme.systemChromeStyle);

    final itemRow = Center(
        child: Column(
            // Stretch the cards in horizontal axis
            crossAxisAlignment: CrossAxisAlignment.stretch,

            ///Pushes sub-layout to the bottom.
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: navigationWidgetsForTheme(theme)),
            Row(children: actionButtonWidgetsForTheme(theme))
          ])
        ]));

    final safeArea = MediaQuery.of(context).padding.top;
    final padding = EdgeInsets.fromLTRB(_padding.left, _padding.top + safeArea,
        _padding.right, _padding.bottom);

    return Container(
        padding: padding,
        decoration: BoxDecoration(color: theme.color.background.brandPrimary),
        child: itemRow);
  }
}
