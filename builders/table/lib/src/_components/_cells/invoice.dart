import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:mask/index.dart';
import 'package:date/index.dart';
import 'package:haptics/index.dart';
import 'package:tag_builder/index.dart';
import 'package:key_value_row_builder/index.dart';
import 'package:invoice_options/index.dart';
import 'package:distance/index.dart' as distance;
import 'package:corner_radius/index.dart' as radius;

import '../_widgets/cell_spaced_row.dart';
import '../_widgets/cell_primary_title.dart';

class InvoiceCell extends StatelessWidget with KeyValueRowBuilder {
  final String name;
  final int totalAmount;
  final int unpaidAmount;
  final int dueTimestamp;
  final InvoiceType invoiceType;
  final VoidCallback onTap;

  InvoiceCell({
    @required this.name,
    @required this.totalAmount,
    @required this.unpaidAmount,
    @required this.dueTimestamp,
    @required this.invoiceType,
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

    final titleWidget = CellPrimaryTitle(name);

    final InvoiceStatusOption invoiceStatus = InvoiceStatus.fromInvoice(
      unpaidAmount,
      dueTimestamp,
    );

    final statusTag = Container(
      margin: EdgeInsets.only(left: _spacing),
      child: _StatusTag(invoiceStatus),
    );

    final titleRow = CellSpacedRow(
      children: <Widget>[
        titleWidget,
        statusTag,
      ],
    );
    List<Widget> columnChildren = [titleRow];

    final dueText =
        Date.fromSecondsSinceEpoch(dueTimestamp).toLongMonthAbbreviatedString;

    final dueRow = buildKeyValueRow(
      context,
      title: "Due",
      value: dueText,
    );
    columnChildren.add(dueRow);

    final formattedTotal = applyMask(
      MaskOption.money,
      text: (totalAmount / 100).toString(),
      context: context,
    );

    final amountRow = buildKeyValueRow(
      context,
      title: "Total amount",
      value: formattedTotal,
    );
    columnChildren.add(amountRow);

    final formattedUnpaid = applyMask(
      MaskOption.money,
      text: (unpaidAmount / 100).toString(),
      context: context,
    );

    final unpaidRow = buildKeyValueRow(
      context,
      title: "Unpaid",
      value: formattedUnpaid,
    );
    columnChildren.add(unpaidRow);

    final typeRow = buildKeyValueRow(
      context,
      title: "Invoice type",
      value: invoiceType.toString(),
    );
    columnChildren.add(typeRow);

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
  final InvoiceStatusOption status;

  _StatusTag(this.status);

  _getStatusColor(InvoiceStatusOption status, RoofInheritedTheme theme) {
    switch (status) {
      case InvoiceStatusOption.paid:
        return theme.color.background.markerGreen;
        break;
      case InvoiceStatusOption.overdue:
        return theme.color.background.errorAction;
        break;
      case InvoiceStatusOption.unpaid:
      default:
        return theme.color.background.markerGray;
    }
  }

  _getStatusText(InvoiceStatusOption status) {
    switch (status) {
      case InvoiceStatusOption.paid:
        return "PAID";
        break;
      case InvoiceStatusOption.overdue:
        return "OVERDUE";
        break;
      case InvoiceStatusOption.unpaid:
      default:
        return "UNPAID";
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
