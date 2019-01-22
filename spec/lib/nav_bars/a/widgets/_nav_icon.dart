import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';

import 'package:spec/color.dart';

class NavIcon extends StatelessWidget {
  final NavigationIconReference iconReference;
  final Color _color = RoofColor.neutralColorG;

  NavIcon({Key key, this.iconReference}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return iconReference.buildSvg(color: _color);
  }
}
