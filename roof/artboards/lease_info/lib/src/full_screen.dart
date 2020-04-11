import 'package:flutter/material.dart';
import 'package:key_value_row_builder/index.dart';
import 'package:spaced_column_vertical_floating_artboard_template/index.dart';
import 'package:button_builder/index.dart';
import 'package:date/index.dart';
import 'package:mask/index.dart';
import 'package:ordinal_suffix_string_from_int/index.dart';
import 'package:fee_payer_type/index.dart';
import 'package:interval/index.dart';

import '_data.dart';

abstract class PropertyInfoVerticalFloatingArtboard
    extends SpacedColumnVerticalFloatingArtboard
    with
        SecondaryCenterButtonBuilder,
        LeaseInfoArtboardData,
        KeyValueRowBuilder {
  String get title => leaseTitle;

  @override
  List<Widget> buildBody(BuildContext context) {
    final List<Widget> children = [];

    final amountInfoRow = buildKeyValueRow(
      context,
      title: "Rent amount",
      value: applyMask(
        MaskOption.money,
        text: totalAmount.toString(),
        context: context,
      ),
    );
    children.add(amountInfoRow);

    _buildScheduleString() {
      final String intervalString =
          toIntervalString(interval, capitalize: true);

      final String frequencyString = frequency.inlineString;

      final String dayString = ordinalSuffixString(dueDay);

      return "$intervalString $frequencyString on the $dayString";
    }

    final dueInfoRow = buildKeyValueRow(
      context,
      title: "Rent due",
      value: _buildScheduleString(),
    );
    children.add(dueInfoRow);

    final startDateInfoRow = buildKeyValueRow(
      context,
      title: "Start date",
      value: Date.fromSecondsSinceEpoch(startTimestamp).toLongString,
    );
    children.add(startDateInfoRow);

    final endDateInfoRow = buildKeyValueRow(
      context,
      title: continueInvoices ? "Currently invoiced until" : "End date",
      value: Date.fromSecondsSinceEpoch(endTimestamp).toLongString,
    );
    children.add(endDateInfoRow);

    if (continueInvoices) {
      final continueInfoRow = buildKeyValueRow(
        context,
        title: "Continue invoices ",
      );
      children.add(continueInfoRow);
    }

    final paymentProfileInfoRow = buildKeyValueRow(
      context,
      title: "Payment profile",
      value: paymentProfile,
    );
    children.add(paymentProfileInfoRow);

    if (lateFeeAmount != null && lateFeeAmount > 0) {
      String _buildLateFeeString() {
        final amountString = applyMask(
          MaskOption.money,
          text: lateFeeAmount.toString(),
          context: context,
        );
        return "$amountString charged $daysUntilLateFee after due date";
      }

      final lateFeeInfoRow = buildKeyValueRow(
        context,
        title: "Late fee",
        value: _buildLateFeeString(),
      );
      children.add(lateFeeInfoRow);
    }

    String _feePayerString(FeePayerType payerType) {
      switch (payerType.toString()) {
        case "payer":
          return "Your tenants pay";
        case "receiver":
          return "You pay";
      }
      return null;
    }

    final feePayerInfoRow = buildKeyValueRow(
      context,
      title: "Transaction fee",
      value: _feePayerString(feePayer),
    );
    children.add(feePayerInfoRow);

    return children;
  }

  @override
  List<Widget> buildButtons(BuildContext context) {
    _goToEditArtboard() {
      // TODO nav to edit property form
    }

    final editButton = buildSecondaryCenterButton(
      context,
      text: "Edit lease",
      onTap: _goToEditArtboard,
    );

    return [editButton];
  }
}
