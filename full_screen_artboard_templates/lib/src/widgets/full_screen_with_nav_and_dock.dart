import 'package:flutter/material.dart';
import 'package:navigation_components/index.dart';

class FullScreenWithNavAndDock extends StatelessWidget {
  final RoofNavBar navBar;
  final Widget dock;
  final Widget body;

  FullScreenWithNavAndDock({this.navBar, this.body, this.dock});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        navBar,
        Expanded(
            child: MediaQuery.removePadding(
                context: context, removeTop: true, child: body)),
        dock
      ],
    );
  }
}
