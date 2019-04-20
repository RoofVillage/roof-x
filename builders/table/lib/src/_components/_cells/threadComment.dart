import 'package:flutter/material.dart';
import 'package:distance/index.dart' as distance;
import 'package:theme/index.dart';
import 'package:typography/index.dart' as typography;

class RoofThreadComment extends StatelessWidget {
  final String creator;
  final int timestamp;
  final String note;

  RoofThreadComment({
    @required this.creator,
    @required this.timestamp,
    @required this.note,
  });

  final double _horizontalPadding = distance.b;
  final double _verticalPadding = distance.b;
  final double _verticalMargin = distance.b;

  @override
  Widget build(BuildContext context) {
    return Container(
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

  final _noteTypographyStyle = typography.bodyPrimary;
  final _creatorTypographyStyle = typography.bodyPrimaryThick;
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

    final timestampWidget = Padding(
      padding: EdgeInsets.only(left: _horizontalSpacing),
      child: Text(
        timestamp.toString(),
        style: _timestampTypographyStyle.textStyleWithColor(
          theme.color.text.secondary,
        ),
      ),
    );

    final headerRow = Row(
      crossAxisAlignment: CrossAxisAlignment.end,
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
