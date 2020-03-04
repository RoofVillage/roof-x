import 'package:flutter/material.dart';
import 'package:standard_icon_library/index.dart';
import 'package:typedefs/index.dart';

import '_components/left_primary_button.dart';

mixin PrimaryLeftButtonBuilder {
  PrimaryLeftButton buildPrimaryLeftButton(
    BuildContext context, {
    @required ContextPasser onTap,
    @required String text,
    StandardIcon iconReference,
    bool hasArrow,
  }) {
    return PrimaryLeftButton(
      onTap: onTap,
      text: text,
      iconReference: iconReference,
      hasArrow: hasArrow,
    );
  }
}