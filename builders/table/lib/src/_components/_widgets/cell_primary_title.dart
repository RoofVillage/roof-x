import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart' as typography;

import '_wrapping_text.dart';

class CellPrimaryTitle extends StatelessWidget {
  final String text;

  CellPrimaryTitle(this.text);

  final _typography = typography.bodyThick;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final color = theme.color.text.secondaryAction;

    final textStyle = _typography.textStyleWithColor(color);
    
    return WrappingText(
      text: text,
      style: textStyle,
    );
  }
}