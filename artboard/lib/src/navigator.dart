import 'dart:async';

import 'package:flutter/material.dart';

import 'artboard.dart';

typedef GoToArtboard = Future<T> Function<T>(Artboard<T> artboard,
    {@required BuildContext context});

typedef PopTo = bool Function<T>(BuildContext context, [T result]);

abstract class ArtboardNavigator extends StatefulWidget {
  final Artboard child;

  ArtboardNavigator({this.child});

  static InheritedArtboardNavigator of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(InheritedArtboardNavigator);
  }
}

abstract class ArtboardNavigatorState extends State<ArtboardNavigator> {
  Future<T> goTo<T>(Artboard<T> artboard, {@required BuildContext context});
  bool pop<T>(BuildContext context, [T result]) {
    widget.child.didComplete();
    return Navigator.pop(context, result ?? widget.child.result);
  }
}

class InheritedArtboardNavigator extends InheritedWidget {
  final GoToArtboard goTo;
  final PopTo pop;

  InheritedArtboardNavigator(
      {Key key, @required ArtboardNavigatorState data, @required Widget child})
      : goTo = data.goTo,
        pop = data.pop,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
