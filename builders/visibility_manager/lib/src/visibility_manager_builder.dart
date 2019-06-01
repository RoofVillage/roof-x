import 'package:flutter/material.dart';

import './_components/visibility_manager.dart';
// TODO new system for exporting types that doesn't break builder pattern
export './_components/visibility_manager.dart';

mixin VisibilityManagerBuilder {
  Widget buildVisibilityManager(BuildContext context, {Widget child}) {
    return InheritedVisibilityManager(
      child: child,
    );
  }
}
