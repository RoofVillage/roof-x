import 'package:flutter/material.dart';

import '_components/nav_button.dart';
import '_components/logo.dart';

mixin LogoNavButtonBuilder {
  RoofLogoNavButton buildLogoNavButton(BuildContext context,
      {@required BuildContextPasser onTap}) {
    return RoofLogoNavButton(onTap: onTap);
  }
}
