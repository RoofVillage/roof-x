import 'package:flutter/material.dart';
import 'package:tag_kind_option/index.dart';

import '_components/tag.dart';

mixin RoofTagBuilder {
  RoofTag buildTag(
    BuildContext context, {
    String text,
    TagKindOption kind,
  }) {
    return RoofTag(
      text: text,
      kind: kind,
    );
  }
}
