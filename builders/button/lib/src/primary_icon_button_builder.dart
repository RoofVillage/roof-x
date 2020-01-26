import 'package:flutter/material.dart';
import 'package:standard_icon_library/index.dart';
import 'package:button_builder/index.dart';

import '_components/primary_icon_button.dart';

mixin PrimaryIconButtonBuilder {
  RoofPrimaryIconButton buildPrimaryIconButton(
    BuildContext context, {
    @required OnTap onTap,
    StandardIcon iconReference,
  }) {
    return RoofPrimaryIconButton(
      onTap: onTap,
      iconReference: iconReference,
    );
  }
}