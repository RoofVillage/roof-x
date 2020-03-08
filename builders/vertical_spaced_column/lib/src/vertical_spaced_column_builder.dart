import 'package:flutter/material.dart';

import '_components/vertical_spaced_column.dart';

mixin VerticalSpacedColumnBuilder {
  VerticalSpacedColumn buildVerticalSpacedColumn(
    BuildContext context, {
    List<Widget> children,
  }) {
    return VerticalSpacedColumn(
      children: children,
    );
  }
}
