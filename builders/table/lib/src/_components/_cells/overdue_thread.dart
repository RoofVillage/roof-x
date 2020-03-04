import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:standard_icon_library/index.dart';
import 'package:decorated_text/index.dart';

import '_thread.dart';

class OverdueThreadCell extends StatelessWidget {
  final String title;
  final WeightDecoratedText secondaryText;
  final StandardIcon iconReference;
  final int timestamp;
  final VoidCallback onTap;

  OverdueThreadCell({
    @required this.title,
    this.secondaryText,
    @required this.iconReference,
    @required this.timestamp,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final titleTextStyle = theme.typography.body.textStyle(
      color: theme.color.text.action,
    );

    final timestampTextStyle = theme.typography.bodyHeavy.textStyle(
      color: theme.color.text.warn,
    );

    return ThreadCell(
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
