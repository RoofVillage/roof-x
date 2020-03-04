import 'package:flutter/material.dart';
import 'package:typedefs/index.dart';

import '_components/logo.dart';

mixin LogoNavButtonBuilder {
  LogoNavButton buildLogoNavButton(
    BuildContext context, {
    @required ContextPasser onTap,
  }) {
    return LogoNavButton(onTap: onTap);
  }
}
