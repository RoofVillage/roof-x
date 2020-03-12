import 'package:flutter/material.dart';

import '_components/full_logo.dart';

mixin FullLogoNavButtonBuilder {
  /// Deprecated: use IconButton builder package
  @deprecated
  FullLogoNavButton buildFullLogoNavButton({
    @required void Function() onTap,
  }) {
    return FullLogoNavButton(
      onTap: onTap,
    );
  }
}
