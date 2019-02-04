import 'package:flutter/material.dart';
import 'package:typography/index.dart';
import 'package:spec/index.dart';

mixin ActivityItem {
  final titleStyle = RoofTypography.title1;
  final timestampStyle = RoofTypography.title1;
  final noteStyle = RoofTypography.body1a;

  static final activityPaddingDistance = RoofDistance.a;

  final EdgeInsets textRightPadding = EdgeInsets.only(right: activityPaddingDistance);
  final Widget spacerRow = Container(height: activityPaddingDistance);
}