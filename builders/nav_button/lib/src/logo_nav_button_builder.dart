import 'package:flutter/material.dart';

import 'components/index.dart';

mixin LogoNavButtonBuilder {
  RoofLogoNavButton buildIconNavButton(BuildContext context,
      {@required BuildContextPasser onTap}) {
    return RoofLogoNavButton(onTap: onTap);
  }
}
