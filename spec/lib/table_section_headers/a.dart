import 'dart:math';

import 'package:flutter/material.dart';

import 'package:spec/color.dart';
import 'package:spec/distance.dart';
import 'package:spec/font_size.dart';
import 'package:spec/font_weight.dart';

class RoofTableSectionHeaderA extends SliverPersistentHeader {
  RoofTableSectionHeaderA({@required String title})
      : super(
            pinned: false,
            floating: false,
            delegate: _RoofTableSectionHeaderADelegate(title: title));
}

class _RoofTableSectionHeaderADelegate extends SliverPersistentHeaderDelegate {
  final String title;

  final Color _backgroundColor = RoofColor.neutralColorA;
  final double minHeight = RoofDistance.e;
  final double maxHeight = RoofDistance.f;

  _RoofTableSectionHeaderADelegate({@required this.title});

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final child = Container(
        color: _backgroundColor,
        child: Center(child: _TitleLabel(text: title)));
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_RoofTableSectionHeaderADelegate oldDelegate) {
    return false;
  }
}

class _TitleLabel extends StatelessWidget {
  final String text;

  final _style = const TextStyle(
      color: RoofColor.primary,
      fontSize: RoofFontSize.large,
      fontWeight: RoofFontWeight.thick);

  const _TitleLabel({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: _style);
  }
}
