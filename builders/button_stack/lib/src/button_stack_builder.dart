import 'package:flutter/material.dart';

import '_components/button_stack.dart';

mixin ButtonStackBuilder {
  List<Widget> get buttonStackButtons;

  RoofButtonStack buildButtonStack(BuildContext context) {
    return RoofButtonStack(buttons: buttonStackButtons);
  }
}
