import 'package:flutter/material.dart';

class FullScreenWithNav extends StatelessWidget {
  final Widget navBar;
  final Widget body;

  FullScreenWithNav({this.navBar, this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        navBar,
        Expanded(
            /*
              Wrap in MediaQuery to remove the top padding that the Scaffold will assume is necessary.
              See https://github.com/flutter/flutter/issues/14842
            */
            child: MediaQuery.removePadding(
                context: context, removeTop: true, child: body))
      ],
    );
  }
}
