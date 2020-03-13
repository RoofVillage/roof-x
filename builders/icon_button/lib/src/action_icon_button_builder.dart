import 'package:flutter/material.dart';
import 'package:navigation_icon_library/index.dart';
import 'package:small_icon_library/index.dart';

import '_components/primary_action_icon_button.dart';
import '_components/secondary_action_icon_button.dart';

mixin ActionIconButtonBuilder {
  PrimaryActionIconButton buildPrimaryActionIconButton({
    @required NavigationIcon iconReference,
    @required void Function() onTap,
  }) {
    return PrimaryActionIconButton(
      onTap: onTap,
      iconReference: iconReference,
    );
  }

  SecondaryActionIconButton buildSecondaryActionIconButton({
    @required SmallIcon iconReference,
    @required void Function() onTap,
  }) {
    return SecondaryActionIconButton(
      onTap: onTap,
      iconReference: iconReference,
    );
  }
}
