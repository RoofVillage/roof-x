import 'package:flutter/material.dart';
import 'package:tag_kind_option/index.dart';
import 'package:date/index.dart';
import 'package:tag_builder/index.dart';
import 'package:key_value_row_builder/index.dart';
import 'package:request_status/index.dart';

import '_a.dart';

class MaintenanceCell extends StatelessWidget with KeyValueRowBuilder {
  final String name;
  final String note;
  final int receivedTimestamp;
  final String status;
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
    final requestStatusOption = RequestStatus.fromRequest(status);

    final statusTag = _StatusTag(requestStatusOption);

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
      rows: <Widget>[receivedRow],
      note: note,
    );
  }
}

class _StatusTag extends StatelessWidget with TagBuilder {
  final RequestStatusOption status;

  _StatusTag(this.status);

  TagKindOption _getTagKind(RequestStatusOption status) {
    switch (status) {
      case RequestStatusOption.closed:
        return TagKindOption.good;
      case RequestStatusOption.emergency:
        return TagKindOption.emergency;
      case RequestStatusOption.open:
      default:
        return TagKindOption.normal;
    }
  }

  _getStatusText(RequestStatusOption status) {
    switch (status) {
      case RequestStatusOption.open:
        return "OPEN";
      case RequestStatusOption.closed:
        return "CLOSED";
      case RequestStatusOption.emergency:
        return "EMERGENCY";
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildTag(
      context,
      text: _getStatusText(status),
      kind: _getTagKind(status)
    );
  }
}
