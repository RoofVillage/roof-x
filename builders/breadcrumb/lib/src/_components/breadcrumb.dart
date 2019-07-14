import 'package:flutter/material.dart';
import 'package:x_small_icon_library/index.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:distance/index.dart' as distance;

class Breadcrumb extends StatelessWidget {
  final String title;
  final XSmallIcon iconReference;

  Breadcrumb({
    this.title,
    this.iconReference,
  });

  final _typographyStyle = typography.body;
  final _horizontalSpacing = distance.b;
  final _horizontalMargin = distance.b;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final textStyle = _typographyStyle.textStyleWithColor(
      theme.color.text.secondary,
    );

    final iconColor = theme.color.icon.secondary;

    List<Widget> rowChildren = [];

    if (iconReference != null) {
      final iconWidget = Padding(
        padding: EdgeInsets.only(right: _horizontalSpacing),
        child: iconReference.buildWidget(color: iconColor),
      );

      rowChildren.add(iconWidget);
    }

    final textWidget = Flexible(
      child: Text(title, style: textStyle),
    );

    rowChildren.add(textWidget);

    return Container(
      padding: EdgeInsets.only(left: _horizontalMargin),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: rowChildren,
      ),
    );
  }
}
