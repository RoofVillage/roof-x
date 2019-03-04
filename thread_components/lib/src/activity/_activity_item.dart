import 'package:flutter/material.dart';
import 'package:typography/index.dart';
import 'package:spec/index.dart';

mixin ActivityItem {
  final titleStyle = RoofTypography.title;
  final timestampStyle = RoofTypography.detailSecondary;
  final noteStyle = RoofTypography.bodyPrimary;

  static final activityPaddingDistance = RoofDistance.a;

  final EdgeInsets textRightPadding = EdgeInsets.only(right: activityPaddingDistance);
  final Widget spacerRow = Container(height: activityPaddingDistance);
}