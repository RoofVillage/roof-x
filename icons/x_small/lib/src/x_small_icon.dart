import 'package:flutter/material.dart';
import 'package:icon_reference/index.dart';
import '_data/roof_x_small_icons_data.dart';

class XSmallIcon extends IconReference {
  static const double _size = 20;

  static final add = XSmallIcon(RoofXSmallIconData.add);
  static final cashSack = XSmallIcon(RoofXSmallIconData.cash_sack);
  static final house = XSmallIcon(RoofXSmallIconData.house);
  static final invite = XSmallIcon(RoofXSmallIconData.invite);
  static final invoice = XSmallIcon(RoofXSmallIconData.invoice);
  static final lease = XSmallIcon(RoofXSmallIconData.lease);
  static final rightArrow = XSmallIcon(RoofXSmallIconData.right_arrow);
  static final thread = XSmallIcon(RoofXSmallIconData.thread);

  XSmallIcon(IconData iconData)
      : super(
          iconData: iconData,
          size: _size,
        );
}
