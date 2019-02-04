import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:icon_library/index.dart';
import 'package:spec/index.dart';

class AnimatedSendButton extends StatelessWidget {
  final Function onTap;
  final bool visible;
  final double buttonHeight;

  AnimatedSendButton({this.onTap, this.visible, this.buttonHeight});

  @override
  Widget build(BuildContext context) {
    final activeColor = RoofTheme.of(context).color.background.submitButton;
    final inactiveColor = activeColor.withAlpha(0);

    final sendIcon = IconReference.sendFilled;

    final activeIcon = sendIcon.buildSvg(color: activeColor);
    final inactiveIcon = sendIcon.buildSvg(color: inactiveColor);

    final padding = EdgeInsets.fromLTRB(RoofDistance.c, 0, RoofDistance.c, 0);

    return GestureDetector(
        onTap: visible ? onTap : null,
        child: Container(
            alignment: Alignment.center,
            padding: padding,
            height: buttonHeight,
            child: AnimatedCrossFade(
                firstChild: activeIcon,
                secondChild: inactiveIcon,
                duration: RoofDuration.short,
                crossFadeState: visible
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstCurve: Curves.easeIn)));
  }
}