import 'package:flutter/material.dart';
import 'package:icon_reference/index.dart';

import '_data/roof_small_icons_data.dart';

class SmallIcon extends IconReference {
  static const double _size = 24;

  static final boxChecked = SmallIcon(RoofSmallIconData.box_checked);
  static final boxUnchecked = SmallIcon(RoofSmallIconData.box_unchecked);
  static final leftArrow = SmallIcon(RoofSmallIconData.left_arrow);
  static final remove = SmallIcon(RoofSmallIconData.remove_filled);
  static final rightArrow = SmallIcon(RoofSmallIconData.right_arrow);

  SmallIcon(IconData iconData)
      : super(
          iconData: iconData,
          size: _size,
        );
}
