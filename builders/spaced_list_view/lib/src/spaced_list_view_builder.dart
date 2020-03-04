import 'package:flutter/widgets.dart';

import '_components/spaced_list_view.dart';

mixin SpacedListViewBuilder {
  Widget buildSpacedListView({
    List<Widget> children,
    Widget button,
    bool buttonIsLast,
    ScrollController scrollController,
  }) =>
      SpacedListView(
        children: children,
        button: button,
        buttonIsLast: buttonIsLast,
        scrollController: scrollController,
      );
}
