import 'package:flutter/widgets.dart';

import '_components/thread_list_view.dart';

mixin RoofThreadListViewBuilder {
  Widget buildThreadList(
    BuildContext context, {
    List<Widget> children,
    Widget button,
    bool reversed,
  }) {
    return RoofThreadListView(children: children, button: button);
  }
}
