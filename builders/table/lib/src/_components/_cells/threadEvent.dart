import 'package:flutter/material.dart';
import 'package:distance/index.dart' as distance;
import 'package:theme/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:corner_radius/index.dart' as radius;
import 'package:icon_library/index.dart';
import 'package:key_value_builder/index.dart';
import 'package:spaced_grid_builder/index.dart';

class RoofThreadEvent extends StatelessWidget {
  final StandardIconReference iconReference;
  final String title;
  final int timestamp;
  final String note;
  final List<KeyValueData> details;

  RoofThreadEvent({
    @required this.iconReference,
    @required this.title,
    @required this.timestamp,
    this.note,
    this.details,
  });

  final double _horizontalPadding = distance.b;
  final _verticalMargin = distance.c;
  final _horizontalSpacing = distance.b;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: _verticalMargin),
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
      child: _Body(
        iconReference: iconReference,
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
  final List<KeyValueData> details;

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

    final iconWidget = iconReference.buildSvg(color: theme.color.icon.general);

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
  final List<KeyValueData> details;

  _Content({
    @required this.title,
    @required this.timestamp,
    this.note,
    this.details,
  });

  final _titleTypographyStyle = typography.bodyPrimary;
  final _timestampTypographyStyle = typography.detailPrimary;
  final _noteTypographyStyle = typography.bodyPrimary;

  final _outerPadding = distance.c;
  final _horizontalSpacing = distance.b;
  final _verticalSpacing = distance.a;
  final _detailsSpacing = distance.b;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final backgroundColor = theme.color.background.generalPrimary;

    final borderRadius = radius.large;

    final titleWidget = Text(
      title,
      style: _titleTypographyStyle.textStyleWithColor(
        theme.color.text.secondary,
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

    final titleRow = Row(
      crossAxisAlignment: CrossAxisAlignment.end,
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
      List<Widget> detailsWidgets = [];

      for (KeyValueData detail in details) {
        final keyValueWidget = buildKeyValue(
          context,
          title: detail.title,
          value: detail.value,
        );

        detailsWidgets.add(keyValueWidget);
      }

      final detailsContainer = Padding(
        padding: EdgeInsets.only(top: _detailsSpacing),
        child: buildSpacedGrid(
          context,
          children: detailsWidgets,
          horizontalSpacing: _detailsSpacing,
          verticalSpacing: _detailsSpacing,
        ),
      );

      verticalChildren.add(detailsContainer);
    }

    return Expanded(
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

class _Detail extends StatelessWidget {
  final String title;
  final String value;

  _Detail({
    @required this.title,
    @required this.value,
  });

  final _titleTypographyStyle = typography.detailPrimary;
  final _valueTypographyStyle = typography.bodyPrimary;
  final _verticalSpacing = distance.a;
  final _verticalMargin = distance.d;
  final _horizontalMargin = distance.c;

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final titleWidget = Text(
      title,
      style: _titleTypographyStyle.textStyleWithColor(
        theme.color.text.secondary,
      ),
    );

    final valueWidget = Container(
      margin: EdgeInsets.only(
        top: _verticalSpacing,
      ),
      child: Text(
        value,
        style: _valueTypographyStyle.textStyleWithColor(
          theme.color.text.primary,
        ),
        softWrap: true,
      ),
    );

    return Container(
      margin: EdgeInsets.only(
        right: _horizontalMargin,
        top: _verticalMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          titleWidget,
          valueWidget,
        ],
      ),
    );
  }
}
