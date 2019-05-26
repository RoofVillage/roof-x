import 'package:flutter/material.dart';
import 'package:key_value_row_builder/index.dart';
import 'package:theme/index.dart';
import 'package:icon_library/index.dart';
import 'package:mask/index.dart';
import 'package:navigable_object_table_artboard_template/index.dart';
import 'package:breadcrumb_stack_builder/index.dart';
import 'package:tabbed_container_builder/index.dart';
// import 'package:key_value_row_builder/index.dart';
import 'package:padded_list_builder/index.dart';

abstract class InvoiceVerticalFullScreenArtboard
    extends NavigableObjectFullScreenArtboard
    with RoofTabbedContainerBuilder, PaddedListBuilder, KeyValueRowBuilder {
  String get invoiceTitle;
  String get homeTitle;
  String get leaseTitle;
  int get totalAmount;
  int get paidAmount;
  int get unpaidAmount;
  int get daysPayableIn;
  String get paymentProfile;

  List<Widget> buildPaymentsCells(BuildContext context);
  
  @override
  String get title => invoiceTitle;

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
    // TODO handle passing in data for navigating to home/lease

    final homeBreadcrumb = RoofBreadcrumb(
      title: homeTitle,
      iconReference: IconReference.houseXSmall,
    );

    final leaseBreadcrumb = RoofBreadcrumb(
      title: leaseTitle,
      iconReference: IconReference.leaseXSmall,
    );

    return [homeBreadcrumb, leaseBreadcrumb];
  }

  @override
  buildInfoRows(BuildContext context) {
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

    final paidAmountString = applyMask(
      MaskOption.money,
      text: (paidAmount / 100).toString(),
      context: context,
    );
    final paidAmountInfoRow = buildKeyValueRow(
      context,
      title: "Paid",
      value: paidAmountString,
    );

    final unpaidAmountString = applyMask(
      MaskOption.money,
      text: (unpaidAmount / 100).toString(),
      context: context,
    );
    final unpaidAmountInfoRow = buildKeyValueRow(
      context,
      title: "Unpaid",
      value: unpaidAmountString,
    );

    // TODO build daysPayable mask
    final daysPayableString = "Payable in xx days";
    final daysPayableInfoRow = buildKeyValueRow(
      context,
      title: "Payable",
      value: daysPayableString,
    );

    final paymentProfileInfoRow = buildKeyValueRow(
      context,
      title: "Payment profile",
      value: paymentProfile,
    );

    return [
      totalAmountInfoRow,
      paidAmountInfoRow,
      unpaidAmountInfoRow,
      daysPayableInfoRow,
      paymentProfileInfoRow,
    ];
  }

  @override
  List<RoofTab> buildTabs(BuildContext context) {
    final paymentsList = buildPaddedList(
      context,
      children: buildPaymentsCells(context),
    );

    return [
      RoofTab(
        title: "Payments",
        view: paymentsList,
      ),
    ];
  }
}
