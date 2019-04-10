import 'package:flutter/material.dart';
import 'package:button_status_option/index.dart';

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
