import 'package:flutter/material.dart';
import 'package:input_dock_components/index.dart';

mixin InputDockArtboard {
  DockActionButton get dockActionButton => null;
  bool get hasInputField => null;
  List<AuxiliaryWidget> get auxiliaryWidgets => null;

  Widget buildInputDock(BuildContext context) {
    return RoofInputDock(
        dockActionButton: dockActionButton,
        auxiliaryWidgets: auxiliaryWidgets);
  }
}
