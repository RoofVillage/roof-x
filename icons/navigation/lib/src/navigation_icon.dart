import 'package:flutter/material.dart';
import 'package:icon_reference/index.dart';

import '_data/navigation_icons_data.dart';

class NavigationIcon extends IconReference {
  static const double _size = 32;

  NavigationIcon(IconData iconData)
      : super(
          iconData: iconData,
          size: _size,
        );

  static final add = NavigationIcon(RoofNavigationIconData.add);
  static final backArrow = NavigationIcon(RoofNavigationIconData.back_arrow);
  static final downArrow = NavigationIcon(RoofNavigationIconData.down_arrow);
  static final info = NavigationIcon(RoofNavigationIconData.info);
  static final logoHouse = NavigationIcon(RoofNavigationIconData.logo_house);
  static final more = NavigationIcon(RoofNavigationIconData.more);
  static final settings = NavigationIcon(RoofNavigationIconData.settings);
}
