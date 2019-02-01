import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:theme/index.dart';

import 'nav_button.dart';
import 'icon.dart';

class RoofTransitionIconNavButton extends RoofIconNavButton {
  @override
  Widget iconForTheme(RoofInheritedTheme theme) {
    return iconReference.buildSvg(color: theme.color.icon.transitionAction);
  }

  RoofTransitionIconNavButton(
      {@required NavigationIconReference iconReference,
      @required BuildContextPasser onTap})
      : super(iconReference: iconReference, onTap: onTap);
}
