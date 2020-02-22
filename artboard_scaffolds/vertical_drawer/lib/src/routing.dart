import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

class VerticalDrawerRoute<T> extends PageRoute<T> {
  WidgetBuilder builder;
  SemanticThemeData theme;

  @override
  Duration get transitionDuration => theme.duration.short;

  @override
  bool get opaque => false;

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  Animation<double> get animation => CurvedAnimation(
        curve: theme.curve.hurried,
        reverseCurve: theme.curve.hurried,
        parent: controller,
      );

  final _fadeTween = Tween<double>(
    begin: 0.8,
    end: 1,
  );
  final _slideTween = Tween<Offset>(
    begin: Offset(-1.0, 0.0),
    end: Offset.zero,
  );

  VerticalDrawerRoute({
    @required this.builder,
    @required this.theme,
  });

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return builder(context);
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final slidingFullScreenWidget = SlideTransition(
      position: animation.drive(_slideTween),
      child: child,
    );

    final fadeSlidingFullScreenWidget = FadeTransition(
      opacity: animation.drive(_fadeTween),
      child: slidingFullScreenWidget,
    );

    return fadeSlidingFullScreenWidget;
  }
}
