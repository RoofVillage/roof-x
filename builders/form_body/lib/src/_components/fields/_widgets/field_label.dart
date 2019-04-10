import 'package:flutter/material.dart';
import 'package:typography/index.dart' as typography;
import 'package:theme/index.dart';

class RoofFieldLabel extends StatelessWidget {
  final String labelText;
  final int maxLines;

  final _labelStyle = typography.title;

  static const _defaultMaxLines = 3;

  RoofFieldLabel(
      {Key key, @required this.labelText, this.maxLines = _defaultMaxLines})
      : super(key: key);

  Widget build(BuildContext context) {
    final textColor = RoofTheme.of(context).color.text.secondary;
    final labelStyle = _labelStyle.textStyleWithColor(textColor);

    return Text(labelText,
        softWrap: true,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: labelStyle);
  }
}
