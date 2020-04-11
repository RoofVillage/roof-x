import 'package:flutter/material.dart';
import 'package:navigation_icon_library/index.dart';

import '_components/icon.dart';

mixin IconNavButtonBuilder {
  /// Deprecated: use IconButton builder package
  @deprecated
  IconNavButton buildIconNavButton({
    @required NavigationIcon iconReference,
    @required void Function() onTap,
  }) {
    return IconNavButton(
      onTap: onTap,
      iconReference: iconReference,
    );
  }
}
