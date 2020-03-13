import 'package:flutter/material.dart';
import 'package:icon_reference/index.dart';

import '_data/roof_small_icons_data.dart';

import 'package:standard_icon_library/index.dart';

class SmallIcon extends IconReference {
  static const double _size = 24;

  static final boxChecked = SmallIcon(RoofSmallIconData.box_checked);
  static final boxUnchecked = SmallIcon(RoofSmallIconData.box_unchecked);
  static final leftArrow = SmallIcon(RoofSmallIconData.left_arrow);
  static final xCircleFilled = SmallIcon(RoofSmallIconData.x_circle_filled);
  static final x = SmallIcon(RoofSmallIconData.x);
  static final rightArrow = SmallIcon(RoofSmallIconData.right_arrow);
  static final settings = SmallIcon(RoofStandardIconData.settings);

  SmallIcon(IconData iconData)
      : super(
          iconData: iconData,
          size: _size,
        );
}
