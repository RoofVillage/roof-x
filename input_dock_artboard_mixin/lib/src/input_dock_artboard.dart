import 'package:flutter/material.dart';
import 'package:input_dock_components/index.dart';

mixin InputDockArtboard {
  DockInputButton get inputButton => null;
  bool get hasInputField => null;
  List<Widget> get auxiliaryWidgets => null;

  Widget buildInputDock(BuildContext context) {
    return RoofInputDock(
        inputButton: inputButton,
        hasInputField: hasInputField,
        auxiliaryWidgets: auxiliaryWidgets);
  }
}
