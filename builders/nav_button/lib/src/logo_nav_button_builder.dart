import 'package:flutter/material.dart';
import 'package:typedefs/index.dart';

import '_components/logo.dart';

mixin LogoNavButtonBuilder {
  RoofLogoNavButton buildLogoNavButton(BuildContext context,
      {@required ContextPasser onTap}) {
    return RoofLogoNavButton(onTap: onTap);
  }
}
