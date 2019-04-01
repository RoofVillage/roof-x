import 'package:flutter/material.dart';

import 'components/index.dart';

mixin InputDockBuilder {
  DockActionButton get actionButton => null;
  List<AuxiliaryWidget> get auxiliaryWidgets => null;

  RoofInputDock buildInputDock(BuildContext context) {
    return RoofInputDock(
      actionButton: actionButton,
      auxiliaryWidgets: auxiliaryWidgets,
    );
  }
}
