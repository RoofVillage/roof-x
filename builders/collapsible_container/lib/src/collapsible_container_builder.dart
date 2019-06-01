import 'package:flutter/material.dart';

import '_components/collapsible_container.dart';

mixin CollapsibleContainerBuilder {
  Widget buildCollapsibleContainer(
    BuildContext context, {
    @required child,
    Key key,
  }) {
    return CollapsibleContainer(
      child: child,
      key: key,
    );
  }
}
