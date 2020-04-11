import 'package:flutter/material.dart';

import '_components/logo.dart';

mixin LogoNavButtonBuilder {
  /// Deprecated: use IconButton builder package
  @deprecated
  LogoNavButton buildLogoNavButton({
    @required void Function() onTap,
  }) {
    return LogoNavButton(onTap: onTap);
  }
}
