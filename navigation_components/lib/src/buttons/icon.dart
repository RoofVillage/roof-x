import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:theme/index.dart';

import 'nav_button.dart';

class RoofIconNavButton extends RoofNavButton {
  final BuildContextPasser _onTap;

  final NavigationIconReference iconReference;

  @override
  void onTap(BuildContext context) => _onTap(context);

  @override
  Widget iconForTheme(RoofInheritedTheme theme) {
    final _blank = NavigationIconReference();
    return (iconReference ?? _blank).buildSvg(color: theme.color.icon.nav);
  }

  RoofIconNavButton(
      {@required this.iconReference, @required BuildContextPasser onTap})
      : _onTap = onTap;
}
