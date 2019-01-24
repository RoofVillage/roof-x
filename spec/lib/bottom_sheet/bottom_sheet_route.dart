import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'widgets/_bottom_sheet_container.dart';

class BottomSheetOverlay extends ModalRoute<void> {
  bool isFirstOverlay;
  BottomSheetOverlay({this.isFirstOverlay = true});

  @override
  Duration get transitionDuration => Duration(milliseconds: 280);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => isFirstOverlay? Colors.black.withOpacity(0.6) : null;

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
    List<Widget> content;

    return RoofBottomSheet(content);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    Animation<double> curvedAnimation =
        controller.drive(CurveTween(curve: Curves.fastOutSlowIn));

    return SlideTransition(
      position: curvedAnimation.drive(Tween<Offset>(
        begin: isFirstOverlay ? Offset(0.0, 1.0) : Offset(1.0, 0),
        end: Offset.zero,
      )),
      child: child,
    );
  }
}
