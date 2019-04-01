import 'package:flutter/material.dart';

import 'components/index.dart';

mixin FullLogoNavButtonBuilder {
  RoofFullLogoNavButton buildFullLogoNavButton(BuildContext context,
      {@required BuildContextPasser onTap}) {
    return RoofFullLogoNavButton(
      onTap: onTap,
    );
  }
}
