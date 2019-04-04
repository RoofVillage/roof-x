import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';

import '_components/nav_button.dart';
import '_components/icon.dart';

mixin IconNavButtonBuilder {
  RoofIconNavButton buildIconNavButton(BuildContext context,
      {@required NavigationIconReference iconReference,
      @required BuildContextPasser onTap}) {
    return RoofIconNavButton(
      onTap: onTap,
      iconReference: iconReference,
    );
  }
}
