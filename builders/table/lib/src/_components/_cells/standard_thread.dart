import 'package:flutter/material.dart';
import 'package:standard_icon_library/index.dart';
import 'package:decorated_text/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:theme/index.dart';

import '_thread.dart';

class RoofStandardThreadCell extends StatelessWidget {
  final String title;
  final WeightDecoratedText secondaryText;
  final StandardIcon iconReference;
  final int timestamp;
  final VoidCallback onTap;

  RoofStandardThreadCell({
    @required this.title,
    this.secondaryText,
    @required this.iconReference,
    @required this.timestamp,
    @required this.onTap,
  });

  final _titleTypographyStyle = typography.bodyPrimary;
  final _timestampTypographyStyle = typography.bodyPrimary;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final titleTextStyle = _titleTypographyStyle.textStyleWithColor(
      theme.color.text.primary,
    );

    final timestampTextStyle = _timestampTypographyStyle.textStyleWithColor(
      theme.color.text.secondary,
    );

    return RoofThreadCell(
      title: title,
      titleTextStyle: titleTextStyle,
      secondaryText: secondaryText,
      iconReference: iconReference,
      timestamp: timestamp,
      timestampTextStyle: timestampTextStyle,
      onTap: onTap,
    );
  }
}
