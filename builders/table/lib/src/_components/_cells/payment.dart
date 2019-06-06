import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:mask/index.dart';
import 'package:date/index.dart';
import 'package:haptics/index.dart';
import 'package:tag_builder/index.dart';
import 'package:key_value_row_builder/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:distance/index.dart' as distance;
import 'package:corner_radius/index.dart' as radius;

import '../_widgets/cell_primary_title.dart';
import '../_widgets/cell_spaced_row.dart';

class PaymentCell extends StatelessWidget with KeyValueRowBuilder {
  final String tenant;
  final int amount;
  final int timestamp;
  final String note;
  final PaymentStatus paymentStatus;
  final VoidCallback onTap;

  PaymentCell({
    @required this.tenant,
    @required this.amount,
    @required this.timestamp,
    this.note,
    @required this.paymentStatus,
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

    final tenantNameWidget = CellPrimaryTitle(tenant);

    final statusTag = Container(
      margin: EdgeInsets.only(left: _spacing),
      child: _StatusTag(paymentStatus),
    );

    final titleRow = CellSpacedRow(
      children: <Widget>[
        tenantNameWidget,
        statusTag,
      ],
    );
    List<Widget> columnChildren = [titleRow];

    final dateText =
        Date.fromSecondsSinceEpoch(timestamp).toLongMonthAbbreviatedString;

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

    final dateRow = buildKeyValueRow(
      context,
      title: "Date",
      value: dateText,
      valueStyle: typography.bodyPrimaryThick.textStyleWithColor(
        theme.color.text.primary,
      ),
    );
    columnChildren.add(dateRow);

    final formattedTotal = applyMask(
      MaskOption.money,
      text: (amount / 100).toString(),
      context: context,
    );

    final amountRow = buildKeyValueRow(
      context,
      title: "Amount",
      value: formattedTotal,
    );
    columnChildren.add(amountRow);

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
  final PaymentStatus status;

  _StatusTag(this.status);

  _getStatusColor(PaymentStatus status, RoofInheritedTheme theme) {
    switch (status) {
      case PaymentStatus.manual:
        return theme.color.background.markerGray;
      case PaymentStatus.cancelled:
        return theme.color.background.markerAlert;
      case PaymentStatus.processed:
        return theme.color.background.markerGreen;
    }
  }

  _getStatusText(PaymentStatus status) {
    switch (status) {
      case PaymentStatus.manual:
        return "MANUAL";
      case PaymentStatus.cancelled:
        return "CANCELLED";
      case PaymentStatus.processed:
        return "PROCESSED";
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final text = _getStatusText(status);
    final color = _getStatusColor(status, theme);

    return buildTag(
      context,
      text: text,
      color: color,
    );
  }
}

enum PaymentStatus {
  manual,
  cancelled,
  processed,
}
