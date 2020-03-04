import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:standard_icon_library/index.dart';
import 'package:decorated_text/index.dart';

import '_thread.dart';

class StandardThreadCell extends StatelessWidget {
  final String title;
  final WeightDecoratedText secondaryText;
  final StandardIcon iconReference;
  final int timestamp;
  final VoidCallback onTap;

  StandardThreadCell({
    @required this.title,
    this.secondaryText,
    @required this.iconReference,
    @required this.timestamp,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    return ThreadCell(
      title: title,
      titleTextStyle: theme.typography.body.textStyle(
        color: theme.color.text.generalPrimary,
      ),
      secondaryText: secondaryText,
      iconReference: iconReference,
      timestamp: timestamp,
      timestampTextStyle: theme.typography.body.textStyle(
        color: theme.color.text.generalSecondary,
      ),
      onTap: onTap,
    );
  }
}
