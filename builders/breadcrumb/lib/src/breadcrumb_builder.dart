import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';

import '_components/breadcrumb.dart';

mixin BreadcrumbBuilder {
  Breadcrumb buildBreadCrumb(
    BuildContext context, {
    @required String title,
    XSmallIconReference iconReference,
  }) {
    return Breadcrumb(
      title: title,
      iconReference: iconReference,
    );
  }
}
