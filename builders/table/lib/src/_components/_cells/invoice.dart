import 'package:flutter/material.dart';
import 'package:mask/index.dart';
import 'package:date/index.dart';
import 'package:tag_builder/index.dart';
import 'package:key_value_row_builder/index.dart';
import 'package:invoice_options/index.dart';
import 'package:tag_kind_option/index.dart';

import '_a.dart';

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

  @override
  Widget build(BuildContext context) {
    final InvoiceStatusOption invoiceStatus = InvoiceStatus.fromInvoice(
      unpaidAmount,
      dueTimestamp,
    );

    final dueText =
        Date.fromSecondsSinceEpoch(dueTimestamp).toLongMonthAbbreviatedString;

    final dueRow = buildKeyValueRow(
      context,
      title: "Due",
      value: dueText,
    );

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

    final typeRow = buildKeyValueRow(
      context,
      title: "Invoice type",
      value: invoiceType.displayString,
    );

    return CellA(
      title: name,
      titleAccessory: _StatusTag(invoiceStatus),
      rows: <Widget>[
        dueRow,
        amountRow,
        unpaidRow,
        typeRow,
      ],
      onTap: onTap,
    );
  }
}

class _StatusTag extends StatelessWidget with TagBuilder {
  final InvoiceStatusOption status;

  _StatusTag(this.status);

  TagKindOption _getTagKind(InvoiceStatusOption status) {
    switch (status) {
      case InvoiceStatusOption.paid:
        return TagKindOption.good;
      case InvoiceStatusOption.overdue:
        return TagKindOption.error;
      case InvoiceStatusOption.unpaid:
      default:
        return TagKindOption.normal;
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
    return buildTag(
      context,
      text: _getStatusText(status),
      kind: _getTagKind(status)
    );
  }
}
