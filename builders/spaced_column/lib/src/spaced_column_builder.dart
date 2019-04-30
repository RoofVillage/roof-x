import 'package:flutter/material.dart';

import '_components/spaced_column.dart';

mixin SpacedColumnBuilder {
  RoofSpacedColumn buildSpacedColumn(
    BuildContext context, {
    @required List<Widget> children,
  }) {
    return RoofSpacedColumn(children: children);
  }
}
