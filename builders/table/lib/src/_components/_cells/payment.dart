import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:mask/index.dart';
import 'package:date/index.dart';
import 'package:haptics/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:distance/index.dart' as distance;
import 'package:corner_radius/index.dart' as radius;
import 'package:key_value_row_builder/index.dart';

import '../tag.dart';

class PaymentCell extends StatelessWidget with KeyValueRowBuilder {
  final String tenant;
  final int amount;
  final int timestamp;
  final String note;
  final PaymentStatus paymentStatus;
  final VoidCallback onTap;

  PaymentCell({
    this.tenant,
    this.amount,
    this.timestamp,
    this.note,
    this.paymentStatus,
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

    final tenantNameWidget = Text(
      tenant,
      style: typography.bodyPrimaryThick.textStyleWithColor(
        theme.color.text.secondaryAction,
      ),
    );

    final statusTag = Container(
      margin: EdgeInsets.only(left: _spacing),
      child: _StatusTag(paymentStatus),
    );

    final titleRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        tenantNameWidget,
        statusTag,
      ],
    );
    List<Widget> columnChildren = [titleRow];

    final dueText =
        Date.fromSecondsSinceEpoch(timestamp).toLongMonthAbbreviatedString;

    final dateRow = buildKeyValueRow(
      context,
      title: "Due",
      value: dueText,
      valueStyle: typography.bodyPrimaryThick.textStyleWithColor(
        theme.color.text.primary,
      ),
      hasBorder: false,
    );
    columnChildren.add(dateRow);

    final formattedTotal = applyMask(
      MaskOption.money,
      text: amount.toString(),
      context: context,
    );

    final amountRow = buildKeyValueRow(
      context,
      title: "Total amount",
      value: formattedTotal,
      hasBorder: false,
    );
    columnChildren.add(amountRow);

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

class _StatusTag extends StatelessWidget {
  final PaymentStatus status;

  _StatusTag(this.status);

  _getStatusColor(PaymentStatus status, RoofInheritedTheme theme) {
    switch (status) {
      case PaymentStatus.manual:
        return theme.color.background.markerGray;
      case PaymentStatus.cancelled:
        return theme.color.background.markerGreen;
    }
  }

  _getStatusText(PaymentStatus status) {
    switch (status) {
      case PaymentStatus.manual:
        return "MANUAL";
      case PaymentStatus.cancelled:
        return "CANCELLED";
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final text = _getStatusText(status);
    final color = _getStatusColor(status, theme);

    return Tag(
      text: text,
      color: color,
    );
  }
}

enum PaymentStatus {
  manual,
  cancelled,
}
