import 'dart:async';

import 'package:flutter/material.dart';
import 'package:full_screen_artboard_templates/index.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:theme/index.dart';
import 'package:artboard/index.dart';
import 'package:keyboard_accessory/index.dart';

import 'routing.dart';

class FullScreenArtboardNavigator extends ArtboardNavigator {
  FullScreenArtboardNavigator({FullScreenArtboard artboard})
      : super(child: artboard);

  @override
  State<StatefulWidget> createState() => FullScreenArtboardNavigatorState();
}

class FullScreenArtboardNavigatorState extends ArtboardNavigatorState {
  Widget build(BuildContext context) {
    return InheritedArtboardNavigator(
        data: this, child: KeyboardAccessory(child: widget.child));
  }

  Future<T> goTo<T>(Artboard artboard, {@required BuildContext context}) async {
    final theme = RoofTheme.of(context);
    if (artboard is FloatingArtboard) {
      final floatingNavigator = FloatingArtboardNavigator(artboard: artboard);
      final result = await Navigator.of(context).push<dynamic>(FloatingRoute(
          builder: (context) => floatingNavigator,
          currentTheme: theme.current));
      if (result is Artboard) {
        return await goTo<T>(result, context: context);
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
}
