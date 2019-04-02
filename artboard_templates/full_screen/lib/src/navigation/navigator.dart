import 'dart:async';

import 'package:flutter/material.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:theme/index.dart';
import 'package:artboard/index.dart';
import 'package:navigation/index.dart';
import 'package:keyboard_accessory/index.dart';

import 'routing.dart';

class FullScreenArtboardNavigator extends StatefulWidget {
  final Artboard artboard;

  FullScreenArtboardNavigator({this.artboard});

  @override
  State<StatefulWidget> createState() => FullScreenInheritedArtboardNavigator();

  static FullScreenInheritedArtboardNavigator of(BuildContext context,
      {bool shouldRebuild = true}) {
    final inheritedWidget = (shouldRebuild
        ? context
            .inheritFromWidgetOfExactType(_FullScreenInheritedArtboardNavigator)
        : context
            .ancestorWidgetOfExactType(_FullScreenInheritedArtboardNavigator));

    return (inheritedWidget as _FullScreenInheritedArtboardNavigator).data;
  }
}

class FullScreenInheritedArtboardNavigator
    extends State<FullScreenArtboardNavigator> {
  Widget build(BuildContext context) {
    final navigator =
        ArtboardNavigator(child: widget.artboard, goTo: _goTo, pop: _pop);
    return _FullScreenInheritedArtboardNavigator(
        data: this, child: KeyboardAccessory(child: navigator));
  }

  Future<T> _goTo<T>(Artboard artboard,
      {@required BuildContext context}) async {
    final theme = RoofTheme.of(context);
    if (artboard is FloatingArtboard) {
      final floatingNavigator = FloatingArtboardNavigator(artboard: artboard);
      final result = await Navigator.of(context).push<dynamic>(FloatingRoute(
          builder: (context) => floatingNavigator,
          currentTheme: theme.current));
      if (result is Artboard) {
        return await _goTo<T>(result, context: context);
      } else if (result is T) {
        return result;
      }
      return Future.value();
    } else {
      return await Navigator.of(context).push<T>(FullScreenRoute(
        builder: (context) => FullScreenArtboardNavigator(artboard: artboard),
      ));
    }
  }

  bool _pop<T>([T result]) => Navigator.pop(context, result);
}

class _FullScreenInheritedArtboardNavigator extends InheritedWidget {
  final FullScreenInheritedArtboardNavigator data;

  _FullScreenInheritedArtboardNavigator(
      {@required this.data, @required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(_FullScreenInheritedArtboardNavigator old) => false;
}
