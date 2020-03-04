import 'package:flutter/material.dart';
import 'package:button_status_option/index.dart';
import 'package:x_small_icon_library/index.dart';
import 'package:button_builder/index.dart';

import '_components/centered_secondary_button.dart';

mixin SecondaryCenterButtonBuilder {
  SecondaryCenterButton buildSecondaryCenterButton(
    BuildContext context, {
    @required OnTap onTap,
    @required String text,
    XSmallIcon icon,
    ButtonStatusOption status,
  }) {
    return SecondaryCenterButton(
      onTap: onTap,
      text: text,
      icon: icon,
      status: status,
    );
  }
}
