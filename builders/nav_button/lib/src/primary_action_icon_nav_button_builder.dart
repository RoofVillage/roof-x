import 'package:flutter/material.dart';
import 'package:navigation_icon_library/index.dart';

import '_components/primary_action_icon.dart';

mixin PrimaryActionIconNavButtonBuilder {
  /// Deprecated: use IconButton builder package
  @deprecated
  PrimaryActionIconNavButton buildPrimaryActionIconNavButton({
    @required NavigationIcon iconReference,
    @required void Function() onTap,
  }) {
    return PrimaryActionIconNavButton(
      onTap: onTap,
      iconReference: iconReference,
    );
  }
}
