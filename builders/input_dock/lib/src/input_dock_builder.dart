import 'package:flutter/material.dart';

import '_components/input_dock.dart';

mixin InputDockBuilder {
  Widget get actionButton => null;
  List<Widget> get auxiliaryWidgets => null;

  RoofInputDock buildInputDock(BuildContext context) {
    return RoofInputDock(
      actionButton: actionButton,
      auxiliaryWidgets: auxiliaryWidgets,
    );
  }
}
