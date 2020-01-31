import 'dart:async';

import 'package:flutter/material.dart';
import 'package:artboard/index.dart';
import 'package:typedefs/index.dart';

typedef GoToArtboard = Future<T> Function<T>(
  Artboard<T> artboard, {
  @required BuildContext context,
});

typedef PopTo = bool Function<T>([T result]);

class ArtboardNavigator extends StatefulWidget {
  final Widget child;
  final GoToArtboard goTo;
  final PopTo pop;
  final FlagListener onNavButtonVisibilityChange;

  ArtboardNavigator({
    @required this.child,
    @required this.goTo,
    @required this.pop,
    this.onNavButtonVisibilityChange,
  });

  @override
  State<StatefulWidget> createState() => InheritedArtboardNavigator();

  static InheritedArtboardNavigator of(
    BuildContext context, {
    bool shouldRebuild = false,
  }) {
    final inheritedWidget = shouldRebuild
        ? context
            .dependOnInheritedWidgetOfExactType<_InheritedArtboardNavigator>()
        : context.findAncestorWidgetOfExactType<_InheritedArtboardNavigator>();

    return inheritedWidget.data;
  }
}

class InheritedArtboardNavigator extends State<ArtboardNavigator> {
  Future<T> goTo<T>(Artboard<T> artboard) {
    return widget.goTo(
      artboard,
      context: context,
    );
  }

  bool pop<T>([T result]) => widget.pop(result);

  void toggleNavButtonsHidden(bool isHidden) {
    if (widget.onNavButtonVisibilityChange == null) return;
    widget.onNavButtonVisibilityChange(isHidden);
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedArtboardNavigator(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedArtboardNavigator extends InheritedWidget {
  final InheritedArtboardNavigator data;

  _InheritedArtboardNavigator({
    @required this.data,
    @required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(_InheritedArtboardNavigator old) => false;
}
