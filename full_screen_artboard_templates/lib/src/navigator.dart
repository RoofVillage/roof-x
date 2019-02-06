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

  void goTo(Artboard artboard, {BuildContext context}) async {
    final theme = RoofTheme.of(context);
    if (artboard is FloatingArtboard) {
      final floatingNavigator = FloatingArtboardNavigator(artboard: artboard);
      final Artboard redirect = await Navigator.of(context).push<Artboard>(
          FloatingRoute(
              builder: (context) => floatingNavigator,
              currentTheme: theme.current));

      if (redirect != null) goTo(redirect, context: context);
    } else {
      Navigator.of(context).push(FullScreenRoute(
        builder: (context) => FullScreenArtboardNavigator(artboard: artboard),
      ));
    }
  }
}
