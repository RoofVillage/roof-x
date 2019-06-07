import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:key_value_row_builder/index.dart';
import 'package:date/index.dart';
import 'package:typography/index.dart' as typography;

import '_a.dart';

class MessageCell extends StatelessWidget with KeyValueRowBuilder {
  final String subject;
  final String message;
  final int latestActivityTimestamp;
  final VoidCallback onTap;

  MessageCell({
    this.subject,
    this.message,
    @required this.latestActivityTimestamp,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final formattedDateText =
        Date.fromSecondsSinceEpoch(latestActivityTimestamp).toAdaptiveString;

    final dateWidget = Text(
      formattedDateText,
      style: typography.detailSecondary.textStyleWithColor(
        theme.color.text.secondary,
      ),
    );

    return CellA(
      title: subject,
      titleAccessory: dateWidget,
      note: message,
    );
  }
}
