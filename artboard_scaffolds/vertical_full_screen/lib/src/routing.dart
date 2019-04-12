import 'package:flutter/material.dart';
import 'package:duration/index.dart' as duration;
import 'package:curve/index.dart' as curve;

class VerticalFullScreenRoute<T> extends PageRoute<T> {
  WidgetBuilder builder;

  @override
  Duration get transitionDuration => duration.short;

  @override
  bool get opaque => false;

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  Animation<double> get animation => CurvedAnimation(
      curve: curve.quick, reverseCurve: curve.quick, parent: controller);

  final _fadeTween = Tween<double>(begin: 0.8, end: 1);
  final _slideTween = Tween<Offset>(begin: Offset(0.5, 0.0), end: Offset.zero);

  VerticalFullScreenRoute({@required this.builder});

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final slidingFullScreenWidget =
        SlideTransition(position: animation.drive(_slideTween), child: child);

    final fadeSlidingFullScreenWidget = FadeTransition(
        opacity: animation.drive(_fadeTween), child: slidingFullScreenWidget);

    return fadeSlidingFullScreenWidget;
  }
}
