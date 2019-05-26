import 'package:flutter/widgets.dart';

import '_components/cells_list_view.dart';

mixin RoofCellsListViewBuilder {
  Widget buildCellsList(
    BuildContext context, {
    List<Widget> children,
    Widget button,
  }) {
    return RoofCellsListView(children: children, button: button);
  }
}
