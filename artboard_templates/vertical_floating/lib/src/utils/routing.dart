import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:curve/index.dart' as curve;
import 'package:duration/index.dart' as duration;

class VerticalFloatingRoute<T> extends ModalRoute<T> {
  WidgetBuilder builder;
  RoofThemeOption currentTheme;

  @override
  Duration get transitionDuration => duration.short;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor =>
      RoofSemanticColor(current: currentTheme).background.scrim;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => false;

  @override
  Animation<double> get animation => CurvedAnimation(
      curve: curve.quick, reverseCurve: curve.quick, parent: controller);

  final _fadeTween = Tween<double>(begin: 0.0, end: 1);
  final _slideTween = Tween<Offset>(begin: Offset(0.0, 0.6), end: Offset.zero);

  VerticalFloatingRoute({@required this.builder, @required this.currentTheme});

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
