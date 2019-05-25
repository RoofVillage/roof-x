import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:distance/index.dart' as distance;
import 'package:theme/index.dart';

mixin RoofNavBar implements StatelessWidget {
  List<Widget> get actionButtons;
  List<Widget> buildNavigationWidgets(BuildContext context);

  final _padding = EdgeInsets.fromLTRB(distance.a, distance.c, distance.a, distance.a);

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: buildNavigationWidgets(context),
              ),
              Row(children: actionButtons),
            ],
          ),
        ],
      ),
    );

    final safeAreaTop = MediaQuery.of(context).padding.top;
    final padding = EdgeInsets.fromLTRB(
      _padding.left,
      _padding.top + safeAreaTop,
      _padding.right,
      _padding.bottom,
    );

    return Container(
      padding: padding,
      decoration: BoxDecoration(color: theme.color.background.generalPrimary),
      child: itemRow,
    );
  }
}
