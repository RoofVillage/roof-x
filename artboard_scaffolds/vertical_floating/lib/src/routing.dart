import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

class VerticalFloatingRoute<T> extends ModalRoute<T> {
  WidgetBuilder builder;
  SemanticThemeData theme;

  @override
  Duration get transitionDuration => theme.duration.medium;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => theme.color.background.scrim;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => false;

  @override
  Animation<double> get animation => CurvedAnimation(
        curve: theme.curve.enter,
        reverseCurve: theme.curve.exit,
        parent: controller,
      );

  final _fadeTween = Tween<double>(
    begin: 0.0,
    end: 1,
  );
  final _slideTween = Tween<Offset>(
    begin: Offset(0.0, 0.6),
    end: Offset.zero,
  );

  VerticalFloatingRoute({
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
    final slidingFloatingWidget = SlideTransition(
      position: animation.drive(_slideTween),
      child: child,
    );

    final fadeSlidingFloatingWidget = FadeTransition(
      opacity: animation.drive(_fadeTween),
      child: slidingFloatingWidget,
    );

    return fadeSlidingFloatingWidget;
  }
}
