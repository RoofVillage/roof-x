import 'package:flutter/widgets.dart';

import '_components/cells_list_view.dart';

mixin CellsListViewBuilder {
  Widget buildCellsList(
    BuildContext context, {
    List<Widget> children,
    Widget button,
    bool reversed,
  }) {
    return CellsListView(
      children: children,
      button: button,
    );
  }
}
