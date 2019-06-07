import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:date/index.dart';
import 'package:tag_builder/index.dart';
import 'package:key_value_row_builder/index.dart';

import '_a.dart';

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

  @override
  Widget build(BuildContext context) {
    final statusTag = _StatusTag(status);

    final receivedText =
        Date.fromSecondsSinceEpoch(receivedTimestamp).toAdaptiveString;

    final receivedRow = buildKeyValueRow(
      context,
      title: "Received",
      value: receivedText,
    );

    return CellA(
      title: name,
      titleAccessory: statusTag,
      rows: <Widget>[
        receivedRow
      ],
      note: note,
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
