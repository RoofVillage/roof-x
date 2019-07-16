import 'package:flutter/material.dart';
import 'package:x_small_icon_library/index.dart';

import '_components/breadcrumb.dart';

mixin BreadcrumbBuilder {
  Breadcrumb buildBreadcrumb(
    BuildContext context, {
    @required String title,
    XSmallIcon iconReference,
  }) {
    return Breadcrumb(
      title: title,
      iconReference: iconReference,
    );
  }
}
