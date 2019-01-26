import 'package:flutter/material.dart';

import 'package:icon_library/index.dart';
import 'package:spec/theme/index.dart';

class RoofNavButton extends StatelessWidget {
  final NavigationIconReference iconReference;
  final Function onTap;

  final _blank = NavigationIconReference();

  RoofNavButton({@required this.iconReference, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    return GestureDetector(
        onTap: onTap,
        child: (iconReference ?? _blank).buildSvg(color: theme.color.icon.nav));
  }
}
