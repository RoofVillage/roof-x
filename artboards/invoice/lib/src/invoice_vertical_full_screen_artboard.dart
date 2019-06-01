import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:icon_library/index.dart';
import 'package:tabbed_fullscreen_artboard_template/index.dart';
import 'package:tab/index.dart';
import 'package:button_builder/index.dart';
import 'package:button_status_option/index.dart';
import 'package:cells_list_view_builder/index.dart';

abstract class InvoiceVerticalFullScreenArtboard
    extends TabbedFullScreenArtboard
    with RoofCellsListViewBuilder, SecondaryCenterButtonBuilder {
  String get invoiceTitle;
  String get leaseTitle;
  String get homeTitle;
  int get totalAmount;
  int get paidAmount;
  int get unpaidAmount;
  int get dueTimestamp;
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
  List<RoofTab> buildTabs(BuildContext context) {
    // TODO implement onTap passing to action buttons

    final paymentsActionButton = buildSecondaryCenterButton(
      context,
      text: "Manually log a payment",
      icon: IconReference.cashSackXSmall,
      onTap: (context) => print("log payment tapped"),
      status: ButtonStatusOption.ready,
    );

    final paymentsList = buildCellsList(context,
        children: buildPaymentsCells(context), button: paymentsActionButton);

    return [
      RoofTab(
        title: "Payments",
        view: paymentsList,
      ),
    ];
  }
}

// @override
// List<RoofBreadcrumb> buildBreadcrumbs(BuildContext context) {
//   // TODO handle passing in data for navigating to home/lease

//   final homeBreadcrumb = RoofBreadcrumb(
//     title: homeTitle,
//     iconReference: IconReference.houseXSmall,
//   );

//   final leaseBreadcrumb = RoofBreadcrumb(
//     title: leaseTitle,
//     iconReference: IconReference.leaseXSmall,
//   );

//   return [homeBreadcrumb, leaseBreadcrumb];
// }

// @override
// buildInfoRows(BuildContext context) {
//   final dueTimestampString =
//       Date.fromSecondsSinceEpoch(dueTimestamp).toLongString;
//   final dueTimestampInfoRow = buildKeyValueRow(
//     context,
//     title: "Due",
//     value: dueTimestampString,
//   );

//   final totalAmountString = applyMask(
//     MaskOption.money,
//     text: (totalAmount / 100).toString(),
//     context: context,
//   );
//   final totalAmountInfoRow = buildKeyValueRow(
//     context,
//     title: "Total",
//     value: totalAmountString,
//   );

//   final paidAmountString = applyMask(
//     MaskOption.money,
//     text: (paidAmount / 100).toString(),
//     context: context,
//   );
//   final paidAmountInfoRow = buildKeyValueRow(
//     context,
//     title: "Paid",
//     value: paidAmountString,
//   );

//   final unpaidAmountString = applyMask(
//     MaskOption.money,
//     text: (unpaidAmount / 100).toString(),
//     context: context,
//   );
//   final unpaidAmountInfoRow = buildKeyValueRow(
//     context,
//     title: "Unpaid",
//     value: unpaidAmountString,
//   );

//   // TODO build daysPayable mask
//   final daysPayableString = "Payable in xx days";
//   final daysPayableInfoRow = buildKeyValueRow(
//     context,
//     title: "Payable",
//     value: daysPayableString,
//   );

//   final paymentProfileInfoRow = buildKeyValueRow(
//     context,
//     title: "Payment profile",
//     value: paymentProfile,
//   );

//   return [
//     dueTimestampInfoRow,
//     totalAmountInfoRow,
//     paidAmountInfoRow,
//     unpaidAmountInfoRow,
//     daysPayableInfoRow,
//     paymentProfileInfoRow,
//   ];
// }