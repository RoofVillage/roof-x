import 'package:flutter/widgets.dart';

import '_components/cells_list_view.dart';

mixin CellsListViewBuilder {
  Widget buildCellsList({
    List<Widget> children,
    Widget button,
    bool buttonIsLast,
  }) {
    return CellsListView(
      children: children,
      button: button,
      buttonIsLast: buttonIsLast,
    );
  }
}
