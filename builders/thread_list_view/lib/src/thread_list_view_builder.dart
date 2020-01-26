import 'package:flutter/widgets.dart';

import '_components/thread_list_view.dart';

mixin ThreadListViewBuilder {
  Widget buildThreadList(
    BuildContext context, {
    List<Widget> children,
    Widget button,
    bool reversed,
  }) {
    return ThreadListView(
      children: children,
      button: button,
    );
  }
}
