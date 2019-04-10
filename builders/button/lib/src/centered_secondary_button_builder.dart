import 'package:flutter/material.dart';

import 'button_status_option.dart';
import '_components/centered_primary.dart';
import '_components/centered_secondary.dart';

mixin SecondaryCenterButtonBuilder {
  RoofSecondaryCenterButton buildSecondaryCenterButton(
    BuildContext context, {
    @required OnTap onTap,
    @required String text,
    ButtonStatusOption status,
  }) {
    return RoofSecondaryCenterButton(
      onTap: onTap,
      text: text,
      status: status,
    );
  }
}
