import 'package:flutter/material.dart';

import '_components/logo.dart';

mixin LogoNavButtonBuilder {
  LogoNavButton buildLogoNavButton({
    @required void Function() onTap,
  }) {
    return LogoNavButton(onTap: onTap);
  }
}
