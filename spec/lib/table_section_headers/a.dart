import 'dart:math';

import 'package:flutter/material.dart';

import 'package:spec/distance.dart';
import 'package:spec/font_size.dart';
import 'package:spec/font_weight.dart';
import 'package:spec/theme/index.dart';

class RoofTableSectionHeaderA extends SliverPersistentHeader {
  RoofTableSectionHeaderA({@required String title})
      : super(
            pinned: false,
            floating: false,
            delegate: _RoofTableSectionHeaderADelegate(title: title));
}

class _RoofTableSectionHeaderADelegate extends SliverPersistentHeaderDelegate {
  final String title;

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
    final theme = RoofTheme.of(context);
    return Container(
        color: theme.backgroundColor.general,
        child: Center(child: _TitleLabel(text: title)));
  }

  @override
  bool shouldRebuild(_RoofTableSectionHeaderADelegate oldDelegate) {
    return true;
  }
}

class _TitleLabel extends StatelessWidget {
  final String text;

  const _TitleLabel({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    final _style = TextStyle(
        color: theme.typeColor.brand,
        fontSize: RoofFontSize.large,
        fontWeight: RoofFontWeight.thick);
    return Text(text, style: _style);
  }
}
