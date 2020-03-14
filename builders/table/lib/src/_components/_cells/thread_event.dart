import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:standard_icon_library/index.dart';
import 'package:key_value_builder/index.dart';
import 'package:spaced_grid_builder/index.dart';
import 'package:date/index.dart';
import 'package:haptics/index.dart';

class ThreadEventCell extends StatelessWidget {
  final String title;
  final int timestamp;
  final StandardIcon iconReference;
  final String note;
  final List<KeyValue> details;
  final VoidCallback onTap;

  ThreadEventCell({
    @required this.title,
    @required this.timestamp,
    this.iconReference,
    this.note,
    this.details,
    this.onTap,
  });

  final _tapHapticOption = HapticOption.light;

  void _fireHaptic() {
    if (onTap != null) triggerHapticWith(_tapHapticOption);
  }

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final _iconReference = iconReference ?? StandardIcon.event;

    return GestureDetector(
      onTapDown: (details) => _fireHaptic(),
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: theme.distance.spacing.vertical.small,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: theme.distance.padding.horizontal.small,
        ),
        child: _Body(
          iconReference: _iconReference,
          title: title,
          timestamp: timestamp,
          note: note,
          details: details,
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final StandardIcon iconReference;
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
  final StandardIcon iconReference;

  _Icon({
    this.iconReference,
  });

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final iconColor = theme.color.icon.generalPrimary;

    final iconWidget = iconReference.buildWidget(color: iconColor);

    return Padding(
      padding: EdgeInsets.only(
        right: theme.distance.padding.horizontal.small,
        top: theme.distance.padding.vertical.small,
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

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final titleWidget = Flexible(
      child: Text(
        title,
        style: theme.typography.body.textStyle(
          color: theme.color.text.generalSecondary,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );

    final formattedTimestamp =
        Date.fromSecondsSinceEpoch(timestamp).toAdaptiveString;

    final timestampWidget = Padding(
      padding: EdgeInsets.only(
        left: theme.distance.padding.horizontal.small,
      ),
      child: Text(
        formattedTimestamp,
        style: theme.typography.detail.textStyle(
          color: theme.color.text.generalSecondary,
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
      final noteWidget = Container(
        margin: EdgeInsets.only(
          top: theme.distance.spacing.vertical.min,
        ),
        child: Text(
          note,
          style: theme.typography.body.textStyle(
            color: theme.color.text.generalPrimary,
          ),
        ),
      );

      verticalChildren.add(noteWidget);
    }

    if (details != null) {
      final detailsContainer = Container(
        margin: EdgeInsets.only(
          top: theme.distance.spacing.vertical.small,
        ),
        child: buildSpacedGrid(
          context,
          children: details,
          horizontalSpacing: theme.distance.spacing.horizontal.small,
          verticalSpacing: theme.distance.spacing.vertical.small,
        ),
      );

      verticalChildren.add(detailsContainer);
    }

    return Flexible(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: theme.distance.padding.horizontal.medium,
          vertical: theme.distance.padding.vertical.medium,
        ),
        decoration: BoxDecoration(
          color: theme.color.background.raised,
          borderRadius: BorderRadius.all(theme.radius.large),
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
