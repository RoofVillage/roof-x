import 'package:flutter/material.dart';

import '_components/standard_stack.dart';

mixin StandardStackBuilder {
  StandardStack buildStandardStack(
    BuildContext context, {
    List<Widget> children,
  }) {
    return StandardStack(
      children: children,
    );
  }
}
