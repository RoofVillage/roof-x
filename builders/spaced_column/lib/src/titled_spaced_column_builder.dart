import 'package:flutter/material.dart';

import '_components/titled_spaced_column.dart';

mixin TitledSpacedColumnBuilder {
  TitledSpacedColumn buildTitledSpacedColumn(
    BuildContext context, {
    @required List<Widget> children,
    @required String title,
  }) {
    return TitledSpacedColumn(
      children: children,
      title: title,
    );
  }
}
