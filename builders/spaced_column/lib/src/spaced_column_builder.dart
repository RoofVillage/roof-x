import 'package:flutter/material.dart';

import '_components/spaced_column.dart';

mixin SpacedColumnBuilder {
  SpacedColumn buildSpacedColumn(
    BuildContext context, {
    List<Widget> children,
  }) {
    return SpacedColumn(
      children: children,
    );
  }
}
