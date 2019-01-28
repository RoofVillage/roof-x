import 'package:flutter/material.dart';
import 'package:spec/index.dart';

class FullPageRoute extends PageRoute<void> {
  WidgetBuilder builder;

  @override
  Duration get transitionDuration =>
      Duration(seconds: 2); // RoofDuration.medium;

  @override
  bool get opaque => false;

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Animation<double> get animation => _fadeTween.animate(_curvedAnimation);

  get _curvedAnimation => CurvedAnimation(
      curve: Curves.easeOut, reverseCurve: Curves.easeIn, parent: controller);

  final _fadeTween = Tween<double>(begin: 0.0, end: 1);
  final _slideTween = Tween<Offset>(begin: Offset(0.6, 0.0), end: Offset.zero);

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
