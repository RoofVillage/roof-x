import 'package:flutter/material.dart';

import 'package:icon_library/index.dart';
import 'package:spec/theme/index.dart';

import 'nav_button.dart';

class RoofIconNavButton extends RoofNavButton {
  final Function _onTap;

  final NavigationIconReference iconReference;

  final _blank = NavigationIconReference();

  @override
  Function onTap() => _onTap;

  @override
  Widget iconForTheme(RoofInheritedTheme theme) {
    return (iconReference ?? _blank).buildSvg(color: theme.color.icon.nav);
  }

  RoofIconNavButton({@required this.iconReference, @required Function onTap})
      : _onTap = onTap;
}
