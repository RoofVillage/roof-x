import 'package:flutter/material.dart';
import 'package:inherited_scroll_controller_builder/src/inherited_scroll_controller_provider.dart';

mixin InheritedScrollControllerBuilder {
  InheritedScrollControllerProvider buildInheritedScrollController({
    @required ScrollController scrollController,
    @required Widget child,
  }) =>
      InheritedScrollControllerProvider(
        scrollController: scrollController,
        child: child,
      );
}
