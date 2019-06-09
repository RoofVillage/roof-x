import 'package:flutter/material.dart';

import 'input_dock.dart';

mixin InputDockBuilder {
  RoofInputDock buildInputDock(
    BuildContext context, {
    Widget actionButton,
    List<Widget> auxiliaryWidgets,
  }) {
    return RoofInputDock(
      actionButton: actionButton,
      auxiliaryWidgets: auxiliaryWidgets,
    );
  }
}
