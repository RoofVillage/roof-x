import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';

import 'button_status_option.dart';
import '_components/centered_primary.dart';
import '_components/centered_secondary.dart';

mixin CenteredButtonBuilder {
  RoofPrimaryCenteredButton buildPrimaryCenteredButton(
    BuildContext context, {
    @required OnTap onTap,
    @required String text,
    StandardIconReference iconReference,
    ButtonStatusOption status,
  }) {
    return RoofPrimaryCenteredButton(
      onTap: onTap,
      text: text,
      iconReference: iconReference,
      status: status,
    );
  }

  RoofSecondaryCenteredButton buildSecondaryCenteredButton(
    BuildContext context, {
    @required OnTap onTap,
    @required String text,
    StandardIconReference iconReference,
    ButtonStatusOption status,
  }) {
    return RoofSecondaryCenteredButton(
      onTap: onTap,
      text: text,
      iconReference: iconReference,
      status: status,
    );
  }
}
