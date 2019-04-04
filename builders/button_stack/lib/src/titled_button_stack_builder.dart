import 'package:flutter/material.dart';

import '_components/titled_button_stack.dart';

mixin TitledButtonStackBuilder {
  RoofTitledButtonStack buildTitledButtonStack(
    BuildContext context, {
    @required List<Widget> buttons,
    @required String title,
  }) {
    return RoofTitledButtonStack(buttons: buttons, title: title);
  }
}
