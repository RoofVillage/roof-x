import 'package:flutter/material.dart';
import 'package:tag_kind_option/index.dart';

import '_components/tag.dart';

mixin TagBuilder {
  StandardTag buildTag(
    BuildContext context, {
    String text,
    TagKindOption kind,
  }) {
    return StandardTag(
      text: text,
      kind: kind,
    );
  }
}
