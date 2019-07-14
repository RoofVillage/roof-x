import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:date/index.dart';
import 'package:haptics/index.dart';
import 'package:distance/index.dart' as distance;
import 'package:typography/index.dart' as typography;

class RoofThreadCommentCell extends StatelessWidget {
  final String creator;
  final int timestamp;
  final String note;
  final VoidCallback onTap;

  RoofThreadCommentCell({
    @required this.creator,
    @required this.timestamp,
    @required this.note,
    this.onTap,
  });

  final double _horizontalPadding = distance.b;
  final double _verticalPadding = distance.b;
  final double _verticalMargin = distance.b;
  final _tapHapticOption = HapticOption.light;

  void _fireHaptic() {
    if (onTap != null) triggerHapticWith(_tapHapticOption);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _fireHaptic(),
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: _verticalMargin),
        padding: EdgeInsets.symmetric(
          horizontal: _horizontalPadding,
          vertical: _verticalPadding,
        ),
        child: _Body(
          creator: creator,
          timestamp: timestamp,
          note: note,
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final String creator;
  final int timestamp;
  final String note;

  _Body({
    @required this.creator,
    @required this.timestamp,
    @required this.note,
  });

  final _noteTypographyStyle = typography.body;
  final _creatorTypographyStyle = typography.bodyThick;
  final _timestampTypographyStyle = typography.detailSecondary;
  final _horizontalSpacing = distance.b;
  final _verticalSpacing = distance.a;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final creatorWidget = Text(
      creator,
      style: _creatorTypographyStyle.textStyleWithColor(
        theme.color.text.primary,
      ),
    );

    final formattedTimestamp =
        Date.fromSecondsSinceEpoch(timestamp).toAdaptiveString;

    final timestampWidget = Padding(
      padding: EdgeInsets.only(left: _horizontalSpacing),
      child: Text(
        formattedTimestamp,
        style: _timestampTypographyStyle.textStyleWithColor(
          theme.color.text.secondary,
        ),
      ),
    );

    final headerRow = Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        creatorWidget,
        timestampWidget,
      ],
    );

    final noteWidget = Padding(
      padding: EdgeInsets.only(top: _verticalSpacing),
      child: Text(
        note,
        style: _noteTypographyStyle.textStyleWithColor(
          theme.color.text.primary,
        ),
      ),
    );

    return Column(
      children: <Widget>[headerRow, noteWidget],
    );
  }
}
