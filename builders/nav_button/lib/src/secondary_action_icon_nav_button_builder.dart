import 'package:flutter/material.dart';
import 'package:x_small_icon_library/index.dart';

import '_components/secondary_action_icon.dart';

mixin SecondaryActionIconNavButtonBuilder {
  /// Deprecated: use IconButton builder package
  @deprecated
  SecondaryActionIconNavButton buildSecondaryActionIconNavButton({
    @required XSmallIcon iconReference,
    @required void Function() onTap,
  }) {
    return SecondaryActionIconNavButton(
      onTap: onTap,
      iconReference: iconReference,
    );
  }
}
