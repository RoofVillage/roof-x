import 'package:flutter/material.dart';
import 'package:button_status_option/index.dart';
import 'package:icon_library/index.dart';

import '_components/centered_primary.dart';
import '_components/centered_secondary.dart';

mixin PrimaryCenterButtonBuilder {
  RoofPrimaryCenterButton buildPrimaryCenterButton(
    BuildContext context, {
    @required OnTap onTap,
    @required String text,
    XSmallIconReference icon,
    ButtonStatusOption status,
  }) {
    return RoofPrimaryCenterButton(
      onTap: onTap,
      text: text,
      icon: icon,
      status: status,
    );
  }
}
