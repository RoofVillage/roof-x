import 'package:flutter/material.dart';

import '_components/button_dock.dart';

mixin ButtonRowDockBuilder {
  List<Widget> Function(BuildContext) get dockButtons;

  ButtonRowDock buildButtonRowDock(BuildContext context) {
    return ButtonRowDock(buttons: dockButtons(context));
  }
}
