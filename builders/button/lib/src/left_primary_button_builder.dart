import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';

import '_components/left_primary.dart';
import '_components/left_secondary.dart';

mixin PrimaryLeftButtonBuilder {
  RoofPrimaryLeftButton buildPrimaryLeftButton(
    BuildContext context, {
    @required OnTap onTap,
    @required String text,
    StandardIconReference iconReference,
    bool hasArrow,
  }) {
    return RoofPrimaryLeftButton(
      onTap: onTap,
      text: text,
      iconReference: iconReference,
      hasArrow: hasArrow,
    );
  }
}
