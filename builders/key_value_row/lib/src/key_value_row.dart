import 'package:flutter/material.dart';
import 'package:typography/index.dart' as typography;
import 'package:distance/index.dart' as distance;
import 'package:theme/index.dart';

class KeyValueRow extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle titleStyle;
  final TextStyle valueStyle;
  final bool hasBorder;

  KeyValueRow({
    this.title,
    this.value,
    this.titleStyle,
    this.valueStyle,
    hasBorder,
  }) : this.hasBorder = hasBorder ?? true;

  final _titleTypographyStyle = typography.detailSecondary;
  final _valueTypographyStyle = typography.bodyPrimary;

  final _horizontalSpacing = distance.c;
  final _verticalSpacing = distance.a;
  final double _minTitleWidth = 110;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final titleWidget = Container(
      constraints: BoxConstraints(
        minWidth: _minTitleWidth,
      ),
      margin: EdgeInsets.only(
        right: _horizontalSpacing,
      ),
      child: Text(
        title,
        style: titleStyle ??
            _titleTypographyStyle.textStyleWithColor(
              theme.color.text.secondary,
            ),
        overflow: TextOverflow.ellipsis,
      ),
    );

    final valueWidget = Expanded(
      child: Text(
        value,
        style: valueStyle ??
            _valueTypographyStyle.textStyleWithColor(
              theme.color.text.primary,
            ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );

    final border = hasBorder
        ? Border(bottom: BorderSide(color: theme.color.stroke.light))
        : Border(bottom: BorderSide(color: Colors.transparent));

    return Container(
      padding: hasBorder
          ? EdgeInsets.symmetric(vertical: _verticalSpacing)
          : EdgeInsets.only(top: _verticalSpacing),
      // decoration: BoxDecoration(
      //   border: border,
      // ),
      child: Row(
        textBaseline: TextBaseline.alphabetic,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          titleWidget,
          valueWidget,
        ],
      ),
    );
  }
}
