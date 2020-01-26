import 'package:flutter/material.dart';

import '_components/button_stack.dart';

mixin ButtonStackBuilder {
  ButtonStack buildButtonStack(
    BuildContext context,
    List<Widget> buttons,
  ) {
    return ButtonStack(
      buttons: buttons,
    );
  }
}
