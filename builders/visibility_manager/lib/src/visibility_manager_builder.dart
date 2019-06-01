import 'package:flutter/material.dart';

import 'package:visibility_manager/index.dart';

mixin VisibilityManagerBuilder {
  Widget buildVisibilityManager({Widget child}) {
    return InheritedVisibilityManager(
      child: child,
    );
  }
}
