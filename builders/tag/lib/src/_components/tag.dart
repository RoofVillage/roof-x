import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:corner_radius/index.dart' as radius;
import 'package:distance/index.dart' as distance;
import 'package:typography/index.dart' as typography;

class RoofTag extends StatelessWidget {
  final String text;
  final Color color;

  RoofTag({
    this.text,
    this.color,
  });

  final _padding = distance.b * .7;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final textStyle = typography.detailSecondary.textStyleWithColor(
      theme.color.text.primaryAction,
    );

    final textWidget = Text(
      text,
      style: textStyle,
    );

    return Container(
      padding: EdgeInsets.all(_padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(radius.small),
        color: color,
      ),
      child: textWidget,
    );
  }
}
