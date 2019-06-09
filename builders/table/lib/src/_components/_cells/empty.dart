import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:distance/index.dart' as distance;

class EmptyMessageCell extends StatelessWidget {
  final String text;

  EmptyMessageCell({this.text});

  final _verticalMargin = distance.d;
  final _typographyStyle = typography.bodySecondary;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final textWidget = Text(
      text,
      style: _typographyStyle.textStyleWithColor(theme.color.text.placeholder),
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: _verticalMargin),
      child: Center(
        child: textWidget,
      ),
    );
  }
}
