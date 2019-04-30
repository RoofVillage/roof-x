import 'package:flutter/material.dart';
import 'package:typography/index.dart' as typography;
import 'package:distance/index.dart' as distance;
import 'package:theme/index.dart';

class KeyValueRow extends StatelessWidget {
  final String title;
  final String value;

  KeyValueRow({
    @required this.title,
    @required this.value,
  });

  final _titleTypographyStyle = typography.detailPrimary;
  final _valueTypographyStyle = typography.bodySecondary;

  final _verticalMargin = distance.a;
  final _horizontalMargin = distance.b;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final titleWidget = Text(
      title,
      style: _titleTypographyStyle.textStyleWithColor(
        theme.color.text.secondary,
      ),
    );

    final valueWidget = Text(
      value,
      textAlign: TextAlign.right,
      style: _valueTypographyStyle.textStyleWithColor(
        theme.color.text.primary,
      ),
      softWrap: true,
    );

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: _horizontalMargin,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
