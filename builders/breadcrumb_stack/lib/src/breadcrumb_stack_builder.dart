import 'package:flutter/material.dart';

import '_components/breadcrumb_stack.dart';
import 'breadcrumb.dart';

mixin RoofBreadcrumbBuilder {
  RoofBreadcrumbStack buildBreadcrumbStack(
    BuildContext context, {
    @required List<RoofBreadcrumb> breadcrumbs,
  }) {
    return RoofBreadcrumbStack(
      breadcrumbs: breadcrumbs,
    );
  }
}
