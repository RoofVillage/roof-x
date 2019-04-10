import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';

import '_components/primary_icon.dart';

mixin PrimaryIconButtonBuilder {
  RoofPrimaryIconButton buildPrimaryIconButton(
    BuildContext context, {
    @required OnTap onTap,
    StandardIconReference iconReference,
  }) {
    return RoofPrimaryIconButton(
      onTap: onTap,
      iconReference: iconReference,
    );
  }
}
