import 'package:flutter/material.dart';
import 'package:navigation_icon_library/index.dart';
import 'package:typedefs/index.dart';

import '_components/icon.dart';

mixin IconNavButtonBuilder {
  RoofIconNavButton buildIconNavButton(BuildContext context,
      {@required NavigationIcon iconReference,
      @required ContextPasser onTap}) {
    return RoofIconNavButton(
      onTap: onTap,
      iconReference: iconReference,
    );
  }
}
