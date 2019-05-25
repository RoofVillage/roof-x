import 'package:flutter/material.dart';
import 'package:distance/index.dart' as distance;
import 'package:theme/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:corner_radius/index.dart' as radius;
import 'package:icon_library/index.dart';
import 'package:key_value_builder/index.dart';
import 'package:spaced_grid_builder/index.dart';
import 'package:date/index.dart';

class RoofThreadEventCell extends StatelessWidget {
  final String title;
  final int timestamp;
  final StandardIconReference iconReference;
  final String note;
  final List<KeyValue> details;

  RoofThreadEventCell({
    @required this.title,
    @required this.timestamp,
    this.iconReference,
    this.note,
    this.details,
  });

  final double _horizontalPadding = distance.b;
  final _verticalMargin = distance.c;
  final _horizontalSpacing = distance.b;

  @override
  Widget build(BuildContext context) {
    final _iconReference = iconReference ?? IconReference.event;

    return Container(
      margin: EdgeInsets.symmetric(vertical: _verticalMargin),
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
      child: _Body(
        iconReference: _iconReference,
        title: title,
        timestamp: timestamp,
        note: note,
        details: details,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final StandardIconReference iconReference;
  final String title;
  final int timestamp;
  final String note;
  final List<KeyValue> details;

  _Body({
    @required this.iconReference,
    @required this.title,
    @required this.timestamp,
    this.note,
    this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _Icon(
          iconReference: iconReference,
        ),
        _Content(
          title: title,
          timestamp: timestamp,
          note: note,
          details: details,
        ),
      ],
    );
  }
}

class _Icon extends StatelessWidget {
  final StandardIconReference iconReference;

  _Icon({
    this.iconReference,
  });

  final _margin = distance.b;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final iconColor = theme.color.icon.general;

    final iconWidget = iconReference.buildSvg(color: iconColor);

    return Padding(
      padding: EdgeInsets.only(
        right: _margin,
        top: _margin,
      ),
      child: iconWidget,
    );
  }
}

class _Content extends StatelessWidget with KeyValueBuilder, SpacedGridBuilder {
  final String title;
  final int timestamp;
  final String note;
  final List<KeyValue> details;

  _Content({
    @required this.title,
    @required this.timestamp,
    this.note,
    this.details,
  });

  final _titleTypographyStyle = typography.bodyPrimary;
  final _timestampTypographyStyle = typography.detailSecondary;
  final _noteTypographyStyle = typography.bodyPrimary;

  final _outerPadding = distance.c;
  final _horizontalSpacing = distance.b;
  final _verticalSpacing = distance.a;
  final _detailsSpacing = distance.b;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final backgroundColor = theme.color.background.generalSecondary;

    final borderRadius = radius.large;

    final titleWidget = Text(
      title,
      style: _titleTypographyStyle.textStyleWithColor(
        theme.color.text.secondary,
      ),
    );

    final formattedTimestamp = Date.fromSecondsSinceEpoch(timestamp).toAdaptiveString;

    final timestampWidget = Padding(
      padding: EdgeInsets.only(left: _horizontalSpacing),
      child: Text(
        formattedTimestamp,
        style: _timestampTypographyStyle.textStyleWithColor(
          theme.color.text.secondary,
        ),
      ),
    );

    final titleRow = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[titleWidget, timestampWidget],
    );

    final List<Widget> verticalChildren = [titleRow];

    if (note != null && note.trim().isNotEmpty) {
      final noteWidget = Padding(
        padding: EdgeInsets.only(top: _verticalSpacing),
        child: Text(
          note,
          style: _noteTypographyStyle.textStyleWithColor(
            theme.color.text.primary,
          ),
        ),
      );

      verticalChildren.add(noteWidget);
    }

    if (details != null) {
      final detailsContainer = Padding(
        padding: EdgeInsets.only(top: _detailsSpacing),
        child: buildSpacedGrid(
          context,
          children: details,
          horizontalSpacing: _detailsSpacing,
          verticalSpacing: _detailsSpacing,
        ),
      );

      verticalChildren.add(detailsContainer);
    }

    return Flexible( 
      child: Container(
        padding: EdgeInsets.all(_outerPadding),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(borderRadius),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: verticalChildren,
        ),
      ),
    );
  }
}
