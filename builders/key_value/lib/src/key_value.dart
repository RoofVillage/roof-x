import 'package:flutter/material.dart';
import 'package:typography/index.dart' as typography;
import 'package:distance/index.dart' as distance;
import 'package:theme/index.dart';

class KeyValue extends StatelessWidget {
  final String title;
  final String value;

  KeyValue({
    @required this.title,
    @required this.value,
  });

  final _titleTypographyStyle = typography.detailPrimary;
  final _valueTypographyStyle = typography.bodySecondary;
  final _verticalSpacing = distance.a;
  final _verticalMargin = distance.d;
  final _horizontalMargin = distance.c;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final titleWidget = Text(
      title,
      style: _titleTypographyStyle.textStyleWithColor(
        theme.color.text.secondary,
      ),
    );

    final valueWidget = Container(
      margin: EdgeInsets.only(
        top: _verticalSpacing,
      ),
      child: Text(
        value,
        style: _valueTypographyStyle.textStyleWithColor(
          theme.color.text.primary,
        ),
        softWrap: true,
      ),
    );

    return Container(
      margin: EdgeInsets.only(
        right: _horizontalMargin,
        top: _verticalMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          titleWidget,
          valueWidget,
        ],
      ),
    );
  }
}
