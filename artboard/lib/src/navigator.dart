import 'dart:async';

import 'package:flutter/material.dart';

import 'artboard.dart';

typedef GoToArtboard = Future Function(Artboard artboard, {BuildContext context});

abstract class ArtboardNavigator extends StatefulWidget {
  final Artboard child;

  ArtboardNavigator({this.child});

  static bool pop(BuildContext context, [Widget widget]) {
    return Navigator.pop(context, widget);
  }

  static InheritedArtboardNavigator of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(InheritedArtboardNavigator);
  }
}

abstract class ArtboardNavigatorState extends State<ArtboardNavigator> {
  Future goTo(Artboard artboard, {BuildContext context});
}

class InheritedArtboardNavigator extends InheritedWidget {
  final GoToArtboard goTo;

  InheritedArtboardNavigator(
      {Key key, @required ArtboardNavigatorState data, @required Widget child})
      : goTo = data.goTo,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
