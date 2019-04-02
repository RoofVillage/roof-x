import 'package:flutter/material.dart';

class FullScreenWithNavAndDock extends StatelessWidget {
  final Widget navBar;
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
