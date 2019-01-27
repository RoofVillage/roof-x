import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'widgets/index.dart';

class RoofBottomSheet extends ModalRoute<void> {
  bool isFirstOverlay;
  RoofBottomSheet({this.isFirstOverlay = true});

  @override
  Duration get transitionDuration => Duration(milliseconds: 280);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor =>
      isFirstOverlay ? Colors.black.withOpacity(0.6) : null;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return _buildOverlayContent(context);
  }

  Widget _buildOverlayContent(BuildContext context) {
    return RoofBottomSheetContainer();
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return _RoofBottomSheetTransition(
        controller: controller, isFirstOverlay: isFirstOverlay, child: child);
  }
}

class _RoofBottomSheetTransition extends StatelessWidget {
  final AnimationController controller;
  final bool isFirstOverlay;
  final Widget child;

  const _RoofBottomSheetTransition(
      {this.controller, this.isFirstOverlay, this.child});

  @override
  Widget build(BuildContext context) {
    final Animation<double> _curvedAnimation =
        controller.drive(CurveTween(curve: Curves.fastOutSlowIn));

    final _animationTween = Tween<Offset>(
        begin: isFirstOverlay ? Offset(0.0, 1.0) : Offset(1.0, 0),
        end: Offset.zero);

    return SlideTransition(
        position: _curvedAnimation.drive(_animationTween), child: child);
  }
}
