import 'package:flutter/widgets.dart';

import '_components/spaced_sliver_list.dart';

mixin SpacedSliverListBuilder {
  Widget buildSpacedSliverList({
    List<Widget> children,
    double horizontalGutter,
    double spacing,
  }) =>
      SpacedSliverList(
        children: children,
        horizontalGutter: horizontalGutter,
        spacing: spacing,
      );
}
