import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:tag_kind_option/index.dart';
import 'package:corner_radius/index.dart' as radius;
import 'package:distance/index.dart' as distance;
import 'package:typography/index.dart' as typography;

class RoofTag extends StatelessWidget {
  final String text;
  final TagKindOption kind;

  RoofTag({
    this.text,
    this.kind = TagKindOption.normal,
  });

  final _horizontalPadding = distance.b * .7;
  final _verticalPadding = distance.b * .5;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    Color _textColor = theme.color.text.tagDefault;
    Color _backgroundColor = theme.color.background.tagDefault;

    switch (kind) {
      case TagKindOption.error:
        _textColor = theme.color.text.tagAlert;
        _backgroundColor = theme.color.background.tagAlert;
        break;
      case TagKindOption.good:
        _textColor = theme.color.text.tagGood;
        _backgroundColor = theme.color.background.tagGood;
        break;
      case TagKindOption.emergency:
        _textColor = theme.color.text.primaryAction;
        _backgroundColor = theme.color.background.emergency;
        break;
      case TagKindOption.normal:
        break;
    }

    final textStyle = typography.detailSecondary.textStyleWithColor(_textColor);

    final textWidget = Text(
      text,
      style: textStyle,
    );

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: _horizontalPadding, vertical: _verticalPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(radius.small),
        color: _backgroundColor,
      ),
      child: textWidget,
    );
  }
}
