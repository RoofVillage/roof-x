import 'package:flutter/widgets.dart';

import '_components/padded_list.dart';

mixin PaddedListBuilder {
  Widget buildPaddedList(
    BuildContext context, {
    List<Widget> children,
  }) {
    return PaddedList(children: children);
  }
}
