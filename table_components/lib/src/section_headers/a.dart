import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:typography/index.dart';
import 'package:theme/index.dart';

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
        color: theme.color.background.general,
        child: Center(child: _TitleLabel(text: title)));
  }

  @override
  bool shouldRebuild(_RoofTableSectionHeaderADelegate oldDelegate) {
    return true;
  }
}

class _TitleLabel extends StatelessWidget {
  final String text;
  final _typographyStyle = RoofTypography.heading2;

  _TitleLabel({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brandColor = RoofTheme.of(context).color.text.brand;
    return Text(text, style: _typographyStyle.textStyleWithColor(brandColor));
  }
}
