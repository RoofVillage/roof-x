import 'dart:async';

import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:vertical_floating_artboard_scaffold/index.dart';
import 'package:horizontal_floating_artboard_scaffold/index.dart';
import 'package:artboard/index.dart';
import 'package:navigator/index.dart';
import 'package:keyboard_accessory/index.dart';

import 'routing.dart';

class VerticalFullScreenArtboardNavigator extends StatefulWidget {
  final Artboard artboard;

  VerticalFullScreenArtboardNavigator({this.artboard});

  @override
  State<StatefulWidget> createState() =>
      VerticalFullScreenInheritedArtboardNavigator();

  static VerticalFullScreenInheritedArtboardNavigator of(
    BuildContext context, {
    bool shouldRebuild = true,
  }) {
    final inheritedWidget = shouldRebuild
        ? context.dependOnInheritedWidgetOfExactType<
            _VerticalFullScreenInheritedArtboardNavigator>()
        : context.findAncestorWidgetOfExactType<
            _VerticalFullScreenInheritedArtboardNavigator>();

    return inheritedWidget.data;
  }
}

class VerticalFullScreenInheritedArtboardNavigator
    extends State<VerticalFullScreenArtboardNavigator> {
  Widget build(BuildContext context) {
    final navigator = ArtboardNavigator(
      child: widget.artboard,
      goTo: _goTo,
      pop: _pop,
    );

    return _VerticalFullScreenInheritedArtboardNavigator(
      data: this,
      child: KeyboardAccessory(child: navigator),
    );
  }

  Future<T> _goTo<T>(
    Artboard artboard, {
    @required BuildContext context,
  }) async {
    if (artboard is VerticalFloatingArtboard) {
      final floatingNavigator = VerticalFloatingArtboardNavigator(
        artboard: artboard,
      );

      final result = await Navigator.of(context).push<dynamic>(
        VerticalFloatingRoute(
          builder: (context) => floatingNavigator,
          theme: SemanticTheme.of(context),
        ),
      );

      if (result is Artboard) {
        return await _goTo<T>(
          result,
          context: context,
        );
      } else if (result is T) {
        return result;
      }

      return Future.value();
    } else if (artboard is HorizontalFloatingArtboard) {
      final floatingNavigator = HorizontalFloatingArtboardNavigator(
        artboard: artboard,
      );

      final result = await Navigator.of(context).push<dynamic>(
        HorizontalFloatingRoute(
          builder: (context) => floatingNavigator,
          theme: SemanticTheme.of(context),
        ),
      );

      if (result is Artboard) {
        return await _goTo<T>(
          result,
          context: context,
        );
      } else if (result is T) {
        return result;
      }

      return Future.value();
    } else {
      return await Navigator.of(context).push<T>(
        VerticalFullScreenRoute(
          builder: (context) {
            return VerticalFullScreenArtboardNavigator(
              artboard: artboard,
            );
          },
          theme: SemanticTheme.of(context),
        ),
      );
    }
  }

  bool _pop<T>([T result]) => Navigator.pop(context, result);
}

class _VerticalFullScreenInheritedArtboardNavigator extends InheritedWidget {
  final VerticalFullScreenInheritedArtboardNavigator data;

  _VerticalFullScreenInheritedArtboardNavigator({
    @required this.data,
    @required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(_VerticalFullScreenInheritedArtboardNavigator old) =>
      false;
}
