import 'package:flutter/material.dart';

import '_components/section_header.dart';

mixin SectionHeaderBuilder {
  SectionHeader buildSectionHeader({
    @required String text,
    double horizontalGutter,
    bool isNewSection,
  }) =>
      SectionHeader(
        text: text,
        horizontalGutter: horizontalGutter,
        isNewSection: isNewSection,
      );
}
