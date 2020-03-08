import 'package:flutter/material.dart';

import '_components/titled_vertical_spaced_column.dart';

mixin TitledVerticalSpacedColumnBuilder {
  TitledVerticalSpacedColumn buildTitledVerticalSpacedColumn(
    BuildContext context, {
    @required List<Widget> children,
    @required String title,
  }) {
    return TitledVerticalSpacedColumn(
      children: children,
      title: title,
    );
  }
}
