import 'package:flutter/material.dart';

import '_components/caret_wrap.dart';

mixin CaretWrapBuilder {
  CaretWrap buildCaretWrap(
    BuildContext context, {
    @required List<Widget> children,
  }) {
    return CaretWrap(
      children: children,
    );
  }
}
