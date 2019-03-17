import 'dart:async';

import 'package:flutter/material.dart';
import 'package:full_screen_artboard_templates/index.dart';
import 'package:floating_artboard_templates/index.dart';
import 'package:theme/index.dart';
import 'package:artboard/index.dart';

import 'routing.dart';

class FullScreenArtboardNavigator extends ArtboardNavigator {
  final FullScreenArtboard artboard;

  FullScreenArtboardNavigator({this.artboard});

  @override
  State<StatefulWidget> createState() =>
      FullScreenArtboardNavigatorState(artboard: artboard);
}

class FullScreenArtboardNavigatorState extends ArtboardNavigatorState {
  final FullScreenArtboard artboard;

  FullScreenArtboardNavigatorState({this.artboard});

  Widget build(BuildContext context) {
    return InheritedArtboardNavigator(data: this, child: artboard);
  }

  Future goTo(Artboard artboard, {BuildContext context}) async {
    final theme = RoofTheme.of(context);
    if (artboard is FloatingArtboard) {
      final floatingNavigator = FloatingArtboardNavigator(artboard: artboard);
      final result = await Navigator.of(context).push<dynamic>(
          FloatingRoute(
              builder: (context) => floatingNavigator,
              currentTheme: theme.current));
      print("RESULT $result");
      if (result is Artboard) return goTo(result, context: context);
      else return result;
    } else {
      return Navigator.of(context).push<dynamic>(FullScreenRoute(
        builder: (context) => FullScreenArtboardNavigator(artboard: artboard),
      ));
    }
  }
}
