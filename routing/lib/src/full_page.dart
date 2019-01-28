import 'package:flutter/material.dart';
import 'package:spec/index.dart';

class FullPageRoute extends PageRoute<void> {
  WidgetBuilder builder;

  @override
  Duration get transitionDuration => RoofDuration.short;

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => false;

  @override
  Animation<double> get animation =>
      controller.drive(_curveTween).drive(_fadeTween);

  final _curveTween = CurveTween(curve: Curves.easeOut);
  final _fadeTween = Tween<double>(begin: 0.0, end: 1);
  final _slideTween = Tween<Offset>(begin: Offset(0.0, 0.1), end: Offset.zero);

  FullPageRoute({@required this.builder});

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final slidingFullScreenPage = SlideTransition(
        position: animation.drive(_slideTween), child: builder(context));

    return slidingFullScreenPage;
  }
}
