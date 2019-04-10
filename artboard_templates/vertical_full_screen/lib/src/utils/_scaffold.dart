import 'package:flutter/material.dart';

class VerticalFullScreenScaffold extends StatelessWidget {
  final Widget navBar;
  final Widget dock;
  final Widget body;

  VerticalFullScreenScaffold({@required this.body, this.navBar, this.dock});

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    if (navBar != null) children.add(navBar);
    final stretchedBody = Expanded(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: body,
      ),
    );

    children.add(stretchedBody);
    if (dock != null) children.add(dock);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }
}
