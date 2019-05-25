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

class InvoiceCell extends StatelessWidget with KeyValueRowBuilder {
  final String name;
  final int totalAmount;
  final int unpaidAmount;
  final int dueTimestamp;
  final InvoiceType invoiceType;
  final InvoiceStatus invoiceStatus;
  final VoidCallback onTap;

  InvoiceCell({
    @required this.name,
    @required this.totalAmount,
    @required this.unpaidAmount,
    @required this.dueTimestamp,
    @required this.invoiceType,
    @required this.invoiceStatus,
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

  String _evalInvoiceType(InvoiceType type) {
    switch (type) {
      case InvoiceType.rent:
        return "Rent";
      case InvoiceType.lateFee:
        return "Late fee";
      case InvoiceType.other:
        return "Other";
    }
    return "";
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

    final statusTag = Container(
      margin: EdgeInsets.only(left: _spacing),
      child: _StatusTag(invoiceStatus),
    );

    final titleRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
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
      valueStyle: typography.bodyPrimaryThick.textStyleWithColor(
        theme.color.text.primary,
      ),
      hasBorder: false,
    );
    columnChildren.add(dueRow);

    final formattedTotal = applyMask(
      MaskOption.money,
      text: totalAmount.toString(),
      context: context,
    );

    final amountRow = buildKeyValueRow(
      context,
      title: "Total amount",
      value: formattedTotal,
      hasBorder: false,
    );
    columnChildren.add(amountRow);

    final formattedUnpaid = applyMask(
      MaskOption.money,
      text: unpaidAmount.toString(),
      context: context,
    );

    final unpaidRow = buildKeyValueRow(
      context,
      title: "Unpaid",
      value: formattedUnpaid,
      hasBorder: false,
    );
    columnChildren.add(unpaidRow);

    final typeRow = buildKeyValueRow(
      context,
      title: "Invoice type",
      value: _evalInvoiceType(invoiceType),
      hasBorder: false,
    );
    columnChildren.add(typeRow);

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
  final InvoiceStatus status;

  _StatusTag(this.status);

  _getStatusColor(InvoiceStatus status, RoofInheritedTheme theme) {
    switch (status) {
      case InvoiceStatus.paid:
        return theme.color.background.markerGreen;
        break;
      case InvoiceStatus.overdue:
        return theme.color.background.errorAction;
        break;
      case InvoiceStatus.unpaid:
      default:
        return theme.color.background.markerGray;
    }
  }

  _getStatusText(InvoiceStatus status) {
    switch (status) {
      case InvoiceStatus.paid:
        return "PAID";
        break;
      case InvoiceStatus.overdue:
        return "OVERDUE";
        break;
      case InvoiceStatus.unpaid:
      default:
        return "UNPAID";
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

enum InvoiceType {
  rent,
  lateFee,
  other,
}

enum InvoiceStatus {
  paid,
  unpaid,
  overdue,
}
