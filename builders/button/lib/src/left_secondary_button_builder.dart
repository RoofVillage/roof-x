import 'package:flutter/material.dart';
import 'package:standard_icon_library/index.dart';
import 'package:typedefs/index.dart';

import '_components/left_secondary.dart';

mixin SecondaryLeftButtonBuilder {
  RoofSecondaryLeftButton buildSecondaryLeftButton(
    BuildContext context, {
    @required ContextPasser onTap,
    @required String text,
    StandardIcon iconReference,
    bool hasArrow,
  }) {
    return RoofSecondaryLeftButton(
      onTap: onTap,
      text: text,
      iconReference: iconReference,
      hasArrow: hasArrow,
    );
  }
}