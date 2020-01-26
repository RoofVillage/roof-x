import 'package:flutter/material.dart';

import '_components/button_stack.dart';

mixin ButtonStackBuilder {
  RoofButtonStack buildButtonStack(
    BuildContext context,
    List<Widget> buttons,
  ) {
    return RoofButtonStack(
      buttons: buttons,
    );
  }
}
