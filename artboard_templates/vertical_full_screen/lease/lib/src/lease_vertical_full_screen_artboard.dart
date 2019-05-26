import 'package:flutter/material.dart';
import 'package:key_value_row_builder/index.dart';
import 'package:theme/index.dart';
import 'package:icon_library/index.dart';
import 'package:mask/index.dart';
import 'package:date/index.dart';
import 'package:navigable_object_table_artboard_template/index.dart';
import 'package:breadcrumb_stack_builder/index.dart';
import 'package:tabbed_container_builder/index.dart';
// import 'package:key_value_row_builder/index.dart';
import 'package:padded_list_builder/index.dart';

abstract class LeaseVerticalFullScreenArtboard
    extends NavigableObjectFullScreenArtboard
    with RoofTabbedContainerBuilder, PaddedListBuilder, KeyValueRowBuilder {
  String get leaseTitle;
  String get homeTitle;
  int get totalAmount;
  // TODO implement due schedule data model (every, every other, week, month, etc)
  String get dueSchedule;
  int get startTimestamp;
  int get endTimestamp;
  bool get continueInvoices;
  String get paymentProfile;
  int get lateFeeAmount;
  int get daysUntilLateFee;
  String get transactionFee;

  List<Widget> buildTenantsCells(BuildContext context);
  List<Widget> buildInvoicesCells(BuildContext context);
  List<Widget> buildMaintenanceCells(BuildContext context);
  List<Widget> buildMessagesCells(BuildContext context);

  @override
  String get title => leaseTitle;

  @override
  Widget buildNavButton(BuildContext context) {
    final theme = RoofTheme.of(context);
    return IconReference.backArrowNav.buildSvg(color: theme.color.icon.nav);
  }

  @override
  List<Widget> buildActionButtons(BuildContext context) {
    final theme = RoofTheme.of(context);

    final moreButton = IconReference.more.buildSvg(color: theme.color.icon.nav);

    return [moreButton];
  }

  @override
  List<RoofBreadcrumb> buildBreadcrumbs(BuildContext context) {
    // TODO handle passing in data for navigating to home

    final homeBreadcrumb = RoofBreadcrumb(
      title: homeTitle,
      iconReference: IconReference.houseXSmall,
    );

    return [homeBreadcrumb];
  }

  @override
  buildInfoRows(BuildContext context) {
    List<Widget> keyValueRows = [];

    final totalAmountString = applyMask(
      MaskOption.money,
      text: (totalAmount / 100).toString(),
      context: context,
    );
    final totalAmountInfoRow = buildKeyValueRow(
      context,
      title: "Total",
      value: totalAmountString,
    );
    keyValueRows.add(totalAmountInfoRow);

    final dueScheduleInfoRow = buildKeyValueRow(
      context,
      title: "Rent due",
      value: dueSchedule,
    );
    keyValueRows.add(dueScheduleInfoRow);

    final startDateInfoRow = buildKeyValueRow(
      context,
      title: "Start date",
      value: Date.fromSecondsSinceEpoch(startTimestamp).toLongString,
    );
    keyValueRows.add(startDateInfoRow);

    final endDateTitle = continueInvoices ? "Invoiced until" : "End date";
    final endDateInfoRow = buildKeyValueRow(
      context,
      title: endDateTitle,
      value: Date.fromSecondsSinceEpoch(startTimestamp).toLongString,
    );
    keyValueRows.add(endDateInfoRow);

    // TODO this should be computed based on rent due schedule data model
    if (continueInvoices) {
      final continuesInfoRow = buildKeyValueRow(
        context,
        title: "Continues",
        value: "Month to month",
      );
      keyValueRows.add(continuesInfoRow);
    }

    final paymentProfileInfoRow = buildKeyValueRow(
      context,
      title: "Payment profile",
      value: paymentProfile,
    );
    keyValueRows.add(paymentProfileInfoRow);

    if (lateFeeAmount != null && daysUntilLateFee != null) {
      final lateFeeAmountText = applyMask(
        MaskOption.money,
        text: (lateFeeAmount / 100).toString(),
        context: context,
      );
      final lateFeeText =
          "$lateFeeAmountText charged $daysUntilLateFee days after deadline";
      final lateFeeInfoRow = buildKeyValueRow(
        context,
        title: "Late fee",
        value: lateFeeText,
      );
      keyValueRows.add(lateFeeInfoRow);
    }

    // TODO implement enum model for "you pay" & "tenant pays"
    final transactionFeeInfoRow = buildKeyValueRow(
      context,
      title: "Transaction fee",
      value: "You pay",
    );
    keyValueRows.add(transactionFeeInfoRow);

    return keyValueRows;
  }

  @override
  List<RoofTab> buildTabs(BuildContext context) {
    final tenantsList = buildPaddedList(
      context,
      children: buildTenantsCells(context),
    );

    final invoicesList = buildPaddedList(
      context,
      children: buildInvoicesCells(context),
    );

    final messagesList = buildPaddedList(
      context,
      children: buildMessagesCells(context),
    );
    final maintenanceList = buildPaddedList(
      context,
      children: buildMaintenanceCells(context),
    );

    return [
      RoofTab(
        title: "Tenants",
        view: tenantsList,
      ),
      RoofTab(
        title: "Invoices",
        view: invoicesList,
      ),
      RoofTab(
        title: "Messages",
        view: messagesList,
      ),
      RoofTab(
        title: "Maintenance",
        view: maintenanceList,
      ),
    ];
  }
}
