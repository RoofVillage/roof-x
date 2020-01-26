import 'package:flutter/material.dart';
import 'package:decorated_text/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:standard_icon_library/index.dart';
import 'package:haptics/index.dart';
import 'package:date/index.dart';

class ThreadCell extends StatelessWidget {
  final StandardIcon iconReference;
  final String title;
  final TextStyle titleTextStyle;
  final WeightDecoratedText secondaryText;
  final int timestamp;
  final TextStyle timestampTextStyle;
  final VoidCallback onTap;

  ThreadCell({
    @required this.iconReference,
    @required this.title,
    @required this.titleTextStyle,
    this.secondaryText,
    @required this.timestamp,
    @required this.timestampTextStyle,
    @required this.onTap,
  });

  final _tapHapticOption = HapticOption.light;

  void _fireHaptic() {
    if (onTap != null) triggerHapticWith(_tapHapticOption);
  }

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final paddedIconWidget = _IconWidget(
      iconReference: iconReference,
    );

    final body = _PaddedBody(
      title: title,
      titleTextStyle: titleTextStyle,
      secondaryText: secondaryText,
    );

    final timestampWidget = _Timestamp(
      timestamp: timestamp,
      timestampTextStyle: timestampTextStyle,
    );

    return GestureDetector(
      onTapDown: (details) => _fireHaptic(),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: theme.distance.padding.horizontal.small,
          vertical: theme.distance.padding.vertical.medium,
        ),
        child: Row(
          children: <Widget>[
            paddedIconWidget,
            body,
            timestampWidget,
          ],
        ),
      ),
    );
  }
}

class _IconWidget extends StatelessWidget {
  final StandardIcon iconReference;

  _IconWidget({
    this.iconReference,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    return iconReference.buildWidget(
      color: theme.color.icon.generalPrimary,
    );
  }
}

class _PaddedBody extends StatelessWidget {
  final String title;
  final TextStyle titleTextStyle;
  final WeightDecoratedText secondaryText;

  _PaddedBody({
    @required this.title,
    @required this.titleTextStyle,
    @required this.secondaryText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    List<Widget> columnChildren = [];

    final titleWidget = Text(
      title,
      style: titleTextStyle,
      overflow: TextOverflow.ellipsis,
    );

    columnChildren.add(titleWidget);

    if (secondaryText != null) {
      final TextStyle defaulTextStyle = theme.typography.detailHeavy.textStyle(
        color: theme.color.text.generalSecondary,
      );
      final TextStyle thinTextStyle = theme.typography.detail.textStyle(
        color: theme.color.text.generalSecondary,
      );

      final secondaryTextWidget = secondaryText.generateWidget(
        defaultStyle: defaulTextStyle,
        thinStyle: thinTextStyle,
        textScaleFactor: MediaQuery.of(context).textScaleFactor,
      );

      final paddedSecondaryTextWidget = Padding(
        padding: EdgeInsets.only(
          top: theme.distance.spacing.vertical.min,
        ),
        child: secondaryTextWidget,
      );

      columnChildren.add(paddedSecondaryTextWidget);
    }

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: theme.distance.padding.horizontal.small,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: columnChildren,
        ),
      ),
    );
  }
}

class _Timestamp extends StatelessWidget {
  final int timestamp;
  final TextStyle timestampTextStyle;

  _Timestamp({
    this.timestamp,
    this.timestampTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    final String formattedTimestamp =
        Date.fromSecondsSinceEpoch(timestamp).toAdaptiveString;

    final timestampWidget = Text(
      formattedTimestamp,
      style: timestampTextStyle,
    );

    return Container(
      child: timestampWidget,
    );
  }
}
