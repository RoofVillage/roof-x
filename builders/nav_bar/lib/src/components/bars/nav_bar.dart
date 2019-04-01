import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';

import '../buttons/index.dart';

mixin RoofNavBar implements StatelessWidget {
  List<RoofNavButton> get actionButtons;
  List<Widget> buildNavigationWidgets(BuildContext context);

  final _padding = EdgeInsets.fromLTRB(RoofDistance.a, 0, RoofDistance.a, 0);

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
                children: buildNavigationWidgets(context)),
            Row(children: actionButtons)
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
