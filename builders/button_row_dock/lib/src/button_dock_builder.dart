import 'package:flutter/material.dart';

import '_components/button_dock.dart';

mixin ButtonDockBuilder {
  List<Widget> get dockButtons;

  RoofButtonDock buildButtonDock(BuildContext context) {
    return RoofButtonDock(buttons: dockButtons);
  }
}
