import 'package:flutter/material.dart';
import 'package:typography/index.dart';
import 'package:theme/index.dart';

class RoofFieldLabel extends StatelessWidget {
  final String labelText;
  final int maxLines;

  final _typographyStyle = RoofTypography.title1;

  static const _defaultMaxLines = 3;

  RoofFieldLabel(
      {Key key, @required this.labelText, this.maxLines = _defaultMaxLines})
      : super(key: key);

  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    return Text(labelText,
        softWrap: true,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: _typographyStyle.textStyleWithColor(theme.color.text.primary));
  }
}
