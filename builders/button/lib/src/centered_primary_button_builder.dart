import 'package:flutter/material.dart';
import 'package:button_status_option/index.dart';

import '_components/centered_primary.dart';
import '_components/centered_secondary.dart';

mixin PrimaryCenterButtonBuilder {
  RoofPrimaryCenterButton buildPrimaryCenterButton(
    BuildContext context, {
    @required OnTap onTap,
    @required String text,
    ButtonStatusOption status,
  }) {
    return RoofPrimaryCenterButton(
      onTap: onTap,
      text: text,
      status: status,
    );
  }
}
