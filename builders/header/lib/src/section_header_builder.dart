import 'package:flutter/material.dart';

import '_components/section_header.dart';

mixin SectionHeaderBuilder {
  SectionHeader buildSectionHeader({
    @required String title,
    String subtitle,
    double horizontalGutter,
    bool withPadding,
  }) =>
      SectionHeader(
        title: title,
        subtitle: subtitle,
        horizontalGutter: horizontalGutter,
        withPadding: withPadding,
      );
}
