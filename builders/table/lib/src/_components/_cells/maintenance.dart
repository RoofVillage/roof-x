import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:date/index.dart';
import 'package:haptics/index.dart';
import 'package:tag_builder/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:distance/index.dart' as distance;
import 'package:corner_radius/index.dart' as radius;
import 'package:key_value_row_builder/index.dart';

class MaintenanceCell extends StatelessWidget with KeyValueRowBuilder {
  final String name;
  final String note;
  final int receivedTimestamp;
  final MaintenanceRequestStatus status;
  final VoidCallback onTap;

  MaintenanceCell({
    @required this.name,
    this.note,
    @required this.receivedTimestamp,
    @required this.status,
    this.onTap,
  });

  final _radius = radius.regular;
  final _cellPadding = distance.c;
  final _spacing = distance.b;
  final _topMargin = distance.b;
  final _tapHapticOption = HapticOption.light;

  void _fireHaptic() {
    if (onTap != null) triggerHapticWith(_tapHapticOption);
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final titleWidget = Text(
      name,
      style: typography.bodyPrimaryThick.textStyleWithColor(
        theme.color.text.secondaryAction,
      ),
    );

    final statusWidget = Container(
      margin: EdgeInsets.only(left: _spacing),
      child: _StatusTag(status),
    );

    final titleRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        titleWidget,
        statusWidget,
      ],
    );
    List<Widget> columnChildren = [titleRow];

    final receivedText =
        Date.fromSecondsSinceEpoch(receivedTimestamp).toAdaptiveString;

    final receivedRow = buildKeyValueRow(
      context,
      title: "Received",
      value: receivedText,
      hasBorder: false,
    );
    columnChildren.add(receivedRow);

    if (note != null && note.isNotEmpty) {
      final messageRow = Container(
        margin: EdgeInsets.only(top: _spacing),
        child: Text(
          note,
          style: typography.bodySecondary.textStyleWithColor(
            theme.color.text.secondary,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      );
      columnChildren.add(messageRow);
    }

    final bodyColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: columnChildren,
    );

    return GestureDetector(
      onTapDown: (details) => _fireHaptic(),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(_cellPadding),
        margin: EdgeInsets.only(top: _topMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(_radius),
          border: Border.all(color: theme.color.stroke.light),
          color: theme.color.background.generalPrimary,
        ),
        child: bodyColumn,
      ),
    );
  }
}

class _StatusTag extends StatelessWidget with RoofTagBuilder {
  final MaintenanceRequestStatus status;

  _StatusTag(this.status);

  _getStatusColor(MaintenanceRequestStatus status, RoofInheritedTheme theme) {
    switch (status) {
      case MaintenanceRequestStatus.closed:
        return theme.color.background.markerGreen;
      case MaintenanceRequestStatus.emergency:
        return theme.color.background.emergency;
      case MaintenanceRequestStatus.open:
      default:
        return theme.color.background.markerGray;
    }
  }

  _getStatusText(MaintenanceRequestStatus status) {
    switch (status) {
      case MaintenanceRequestStatus.open:
        return "OPEN";
      case MaintenanceRequestStatus.closed:
        return "CLOSED";
      case MaintenanceRequestStatus.emergency:
        return "EMERGENCY";
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final color = _getStatusColor(status, theme);
    final text = _getStatusText(status);

    return buildTag(
      context,
      text: text,
      color: color,
    );
  }
}

enum MaintenanceRequestStatus {
  open,
  closed,
  emergency,
}
