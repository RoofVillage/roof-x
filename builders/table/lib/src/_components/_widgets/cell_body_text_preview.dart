import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart' as typography;

class CellBodyTextPreview extends StatelessWidget {
  final String text;

  CellBodyTextPreview(this.text);

  final _typography = typography.bodySecondary;
  final _maxLines = 2;
  final _overflowKind = TextOverflow.ellipsis;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final color = theme.color.text.secondary;

    final textStyle = _typography.textStyleWithColor(color);

    return Text(
      text,
      style: textStyle,
      maxLines: _maxLines,
      overflow: _overflowKind,
    );
  }
}
