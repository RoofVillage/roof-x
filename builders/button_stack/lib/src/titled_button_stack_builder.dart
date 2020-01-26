import 'package:flutter/material.dart';

import '_components/titled_button_stack.dart';

mixin TitledStackBuilder {
  TitledButtonStack buildTitledButtonStack(
    BuildContext context, {
    @required List<Widget> buttons,
    @required String title,
  }) {
    return TitledButtonStack(buttons: buttons, title: title);
  }
}
