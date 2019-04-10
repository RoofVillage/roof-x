import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:typedefs/index.dart';

import '_components/icon.dart';

mixin IconNavButtonBuilder {
  RoofIconNavButton buildIconNavButton(BuildContext context,
      {@required NavigationIconReference iconReference,
      @required ContextPasser onTap}) {
    return RoofIconNavButton(
      onTap: onTap,
      iconReference: iconReference,
    );
  }
}
