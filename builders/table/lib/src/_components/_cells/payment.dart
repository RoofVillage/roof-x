import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:tag_kind_option/index.dart';
import 'package:mask/index.dart';
import 'package:date/index.dart';
import 'package:haptics/index.dart';
import 'package:tag_builder/index.dart';
import 'package:key_value_row_builder/index.dart';

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

  // final _radius = radius.regular;
  // final _cellPadding = distance.c;
  // final _spacing = distance.b;
  // final _topMargin = distance.b;
  final _tapHapticOption = HapticOption.light;

  void _fireHaptic() {
    if (onTap != null) triggerHapticWith(_tapHapticOption);
  }

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final tenantNameWidget = CellPrimaryTitle(tenant);

    final statusTag = Container(
      margin: EdgeInsets.only(
        left: theme.distance.spacing.horizontal.small,
      ),
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
        margin: EdgeInsets.only(
          top: theme.distance.spacing.vertical.small,
        ),
        child: Text(
          note,
          style: theme.typography.body.textStyle(
            color: theme.color.text.generalSecondary,
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
      valueStyle: theme.typography.bodyHeavy.textStyle(
        color: theme.color.text.generalPrimary,
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
        padding: EdgeInsets.symmetric(
          horizontal: theme.distance.padding.horizontal.medium,
          vertical: theme.distance.padding.vertical.medium,
        ),
        margin: EdgeInsets.only(
          top: theme.distance.spacing.vertical.small,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            theme.radius.medium,
          ),
          border: Border.all(color: theme.color.stroke.medium),
          color: theme.color.background.raised,
        ),
        child: bodyColumn,
      ),
    );
  }
}

class _StatusTag extends StatelessWidget with TagBuilder {
  final PaymentStatus status;

  _StatusTag(this.status);

  TagKindOption _getTagKind(PaymentStatus status) {
    switch (status) {
      case PaymentStatus.cancelled:
        return TagKindOption.error;
      case PaymentStatus.processed:
        return TagKindOption.good;
      case PaymentStatus.manual:
      default:
        return TagKindOption.normal;
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
    return buildTag(
      context,
      text: _getStatusText(status),
      kind: _getTagKind(status),
    );
  }
}

enum PaymentStatus {
  manual,
  cancelled,
  processed,
}
