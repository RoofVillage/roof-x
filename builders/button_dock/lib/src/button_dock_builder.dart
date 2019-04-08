import 'package:flutter/material.dart';

import '_components/button_dock.dart';

mixin ButtonDockBuilder {
  String get leftButtonTitle;
  String get rightButtonTitle;
  Function get leftButtonAction;
  Function get rightButtonAction;

  RoofButtonDock buildButtonDock(BuildContext context) {
    return RoofButtonDock(
      leftButtonTitle: leftButtonTitle,
      rightButtonTitle: rightButtonTitle,
      leftButtonAction: leftButtonAction,
      rightButtonAction: rightButtonAction,
    );
  }
}
