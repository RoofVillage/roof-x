import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';

import '_components/left_primary.dart';
import '_components/left_secondary.dart';

mixin SecondaryLeftButtonBuilder {
  RoofSecondaryLeftButton buildSecondaryLeftButton(
    BuildContext context, {
    @required OnTap onTap,
    @required String text,
    StandardIconReference iconReference,
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
