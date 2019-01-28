import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';

class FloatingModalRoute extends ModalRoute<void> {
  WidgetBuilder builder;
  RoofThemeOption currentTheme;

  @override
  Duration get transitionDuration => RoofDuration.short;

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
  Animation<double> get animation => _fadeTween.animate(_curvedAnimation);

  get _curvedAnimation => CurvedAnimation(
      curve: Curves.easeOut, reverseCurve: Curves.easeIn, parent: controller);

  final _fadeTween = Tween<double>(begin: 0.0, end: 1);
  final _slideTween = Tween<Offset>(begin: Offset(0.0, 0.1), end: Offset.zero);

  FloatingModalRoute({@required this.builder, @required this.currentTheme});

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final slidingBottomSheet = SlideTransition(
        position: animation.drive(_slideTween), child: builder(context));

    return slidingBottomSheet;
  }
}
