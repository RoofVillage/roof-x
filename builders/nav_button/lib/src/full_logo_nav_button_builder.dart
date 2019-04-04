import 'package:flutter/material.dart';

import '_components/full_logo.dart';
import '_components/nav_button.dart';

mixin FullLogoNavButtonBuilder {
  RoofFullLogoNavButton buildFullLogoNavButton(BuildContext context,
      {@required BuildContextPasser onTap}) {
    return RoofFullLogoNavButton(
      onTap: onTap,
    );
  }
}
