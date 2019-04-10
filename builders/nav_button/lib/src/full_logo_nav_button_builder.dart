import 'package:flutter/material.dart';
import 'package:typedefs/index.dart';

import '_components/full_logo.dart';

mixin FullLogoNavButtonBuilder {
  RoofFullLogoNavButton buildFullLogoNavButton(BuildContext context,
      {@required ContextPasser onTap}) {
    return RoofFullLogoNavButton(
      onTap: onTap,
    );
  }
}
