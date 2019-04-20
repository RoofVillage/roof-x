import 'package:flutter/material.dart';

import '_components/spaced_grid.dart';

mixin SpacedGridBuilder {
  Widget buildSpacedGrid(
    BuildContext context, {
    List<Widget> children,
    double horizontalSpacing,
    double verticalSpacing,
  }) {
    return SpacedGrid(
      children: children,
      horizontalSpacing: horizontalSpacing,
      verticalSpacing: verticalSpacing,
    );
  }
}
