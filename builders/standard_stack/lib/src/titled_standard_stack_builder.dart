import 'package:flutter/material.dart';

import '_components/titled_standard_stack.dart';

mixin TitledStandardStackBuilder {
  TitledStandardStack buildTitledStandardStack(
    BuildContext context, {
    @required List<Widget> children,
    @required String title,
  }) {
    return TitledStandardStack(
      children: children,
      title: title,
    );
  }
}
