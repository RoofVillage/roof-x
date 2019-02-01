import 'package:flutter/material.dart';
import 'package:artboard_templates/index.dart';
import 'package:routing/index.dart';
import 'package:theme/index.dart';

import 'artboard_navigator.dart';
import 'floating_artboard_navigator.dart';

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
