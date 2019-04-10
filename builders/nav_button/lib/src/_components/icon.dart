import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';
import 'package:theme/index.dart';
import 'package:typedefs/index.dart';

import 'nav_button.dart';

class RoofIconNavButton extends StatelessWidget with RoofNavButton {
  final ContextPasser onTap;

  final NavigationIconReference iconReference;

  @override
  Widget iconForTheme(RoofInheritedTheme theme) {
    final _blank = NavigationIconReference();
    return (iconReference ?? _blank).buildSvg(color: theme.color.icon.nav);
  }

  RoofIconNavButton({@required this.iconReference, @required this.onTap});
}
