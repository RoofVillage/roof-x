import 'dart:math';

import 'package:flutter/material.dart';

import 'package:spec/color.dart';
import 'package:spec/distance.dart';

import './widgets/index.dart';

class RoofTableSectionHeaderADelegate extends SliverPersistentHeaderDelegate {
  final String title;

  final Color _backgroundColor = RoofColor.neutralColorA;
  final double minHeight = RoofDistance.e;
  final double maxHeight = RoofDistance.f;

  RoofTableSectionHeaderADelegate({@required this.title});

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final child = Container(
        color: _backgroundColor, child: Center(child: TitleLabel(text: title)));
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(RoofTableSectionHeaderADelegate oldDelegate) {
    return false;
  }
}
