import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:distance/index.dart' as distance;
import '_button_dock_button.dart';

class RoofButtonDock extends StatelessWidget {
  final String leftButtonTitle;
  final String rightButtonTitle;
  final Function leftButtonAction;
  final Function rightButtonAction;

  RoofButtonDock({
    this.leftButtonAction,
    this.leftButtonTitle,
    this.rightButtonAction,
    this.rightButtonTitle,
  });

  final _typographyStyle = typography.button;
  final _paddingSize = distance.c;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final leftButton = ButtonDockButton(
      title: leftButtonTitle,
      action: leftButtonAction,
      textStyle: _typographyStyle.textStyleWithColor(
        theme.color.text.transitionAction,
      ),
      buttonColor: theme.color.background.transitionButton,
    );

    final rightButton = ButtonDockButton(
      title: rightButtonTitle,
      action: rightButtonAction,
      textStyle: _typographyStyle.textStyleWithColor(
        theme.color.text.submitAction,
      ),
      buttonColor: theme.color.background.submitButton,
    );

    final spacer = Container(width: _paddingSize);

    return Container(
      padding: EdgeInsets.all(_paddingSize),
      child: Row(
        children: [leftButton, spacer, rightButton],
      ),
    );
  }
}
