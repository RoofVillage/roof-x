import 'package:flutter/material.dart';
import 'package:decorated_text/index.dart';
import 'package:standard_icon_library/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:distance/index.dart' as distance;
import 'package:theme/index.dart';
import 'package:haptics/index.dart';
import 'package:date/index.dart';

class RoofThreadCell extends StatelessWidget {
  final StandardIcon iconReference;
  final String title;
  final TextStyle titleTextStyle;
  final WeightDecoratedText secondaryText;
  final int timestamp;
  final TextStyle timestampTextStyle;
  final VoidCallback onTap;

  RoofThreadCell({
    @required this.iconReference,
    @required this.title,
    @required this.titleTextStyle,
    this.secondaryText,
    @required this.timestamp,
    @required this.timestampTextStyle,
    @required this.onTap,
  });

  final _horizontalPadding = distance.b;
  final _verticalPadding = distance.c;
  final _tapHapticOption = HapticOption.light;

  void _fireHaptic() {
    if (onTap != null) triggerHapticWith(_tapHapticOption);
  }

  @override
  Widget build(BuildContext context) {
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
          horizontal: _horizontalPadding,
          vertical: _verticalPadding,
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
    final theme = RoofTheme.of(context);

    return iconReference.buildWidget(color: theme.color.icon.general);
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

  final _secondaryTextTypographyStyle = typography.detailPrimary;
  final _secondaryTextTypographyThinStyle = typography.detailSecondary;

  final _verticalSpacing = distance.a;
  final _horizontalSpacing = distance.b;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    List<Widget> columnChildren = [];

    final titleWidget = Text(
      title,
      style: titleTextStyle,
      overflow: TextOverflow.ellipsis,
    );

    columnChildren.add(titleWidget);

    final secondaryTextColor = theme.color.text.secondary;
    final secondaryTextThinColor = theme.color.text.secondary;

    if (secondaryText != null) {
      final secondaryTextWidget = secondaryText.generateWidget(
        defaultStyle: _secondaryTextTypographyStyle.textStyleWithColor(
          secondaryTextColor,
        ),
        thinStyle: _secondaryTextTypographyThinStyle.textStyleWithColor(
          secondaryTextThinColor,
        ),
        textScaleFactor: MediaQuery.of(context).textScaleFactor,
      );

      final paddedSecondaryTextWidget = Padding(
        padding: EdgeInsets.only(top: _verticalSpacing),
        child: secondaryTextWidget,
      );

      columnChildren.add(paddedSecondaryTextWidget);
    }

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _horizontalSpacing),
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
