import 'package:flutter/material.dart';
import 'package:standard_icon_library/index.dart';
import 'package:typedefs/index.dart';

import '_components/left_secondary_button.dart';

mixin SecondaryLeftButtonBuilder {
  SecondaryLeftButton buildSecondaryLeftButton(
    BuildContext context, {
    @required ContextPasser onTap,
    @required String text,
    StandardIcon iconReference,
    bool hasArrow,
  }) {
    return SecondaryLeftButton(
      onTap: onTap,
      text: text,
      iconReference: iconReference,
      hasArrow: hasArrow,
    );
  }
}