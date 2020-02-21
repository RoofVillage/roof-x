import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:navigation_icon_library/index.dart';
import 'package:x_small_icon_library/index.dart';
import 'package:tabbed_fullscreen_artboard_template/index.dart';
import 'package:tab/index.dart';
import 'package:button_builder/index.dart';
import 'package:button_status_option/index.dart';
import 'package:spaced_list_view_builder/index.dart';

import '_data.dart';

abstract class InvoiceVerticalFullScreenArtboard
    extends TabbedFullScreenArtboard
    with
        SpacedListViewBuilder,
        SecondaryCenterButtonBuilder,
        InvoiceArtboardData {
  @override
  String get title => invoiceTitle;

  @override
  Widget buildNavButton(BuildContext context) {
    final theme = RoofTheme.of(context);
    return NavigationIcon.backArrow.buildWidget(
      color: theme.color.icon.nav,
    );
  }

  @override
  List<Widget> buildActionButtons(BuildContext context) {
    final theme = RoofTheme.of(context);

    final moreButton = NavigationIcon.more.buildWidget(
      color: theme.color.icon.nav,
    );

    return [moreButton];
  }

  // TODO convert this to accept data objects instead of widgets, build cells here
  List<Widget> buildPaymentsCells(BuildContext context);

  @override
  List<RoofTab> buildTabs(BuildContext context) {
    // TODO implement onTap passing to action buttons

    final paymentsActionButton = buildSecondaryCenterButton(
      context,
      text: "Manually log a payment",
      icon: XSmallIcon.cashSack,
      onTap: (context) => print("log payment tapped"),
      status: ButtonStatusOption.ready,
    );

    final paymentsList = buildSpacedListView(
      children: buildPaymentsCells(context),
      button: paymentsActionButton,
    );

    return [
      RoofTab(
        title: "Payments",
        view: paymentsList,
      ),
    ];
  }
}

// @override
// List<Breadcrumb> buildBreadcrumbs(BuildContext context) {
//   // TODO handle passing in data for navigating to home/lease

//   final homeBreadcrumb = Breadcrumb(
//     title: homeTitle,
//     iconReference: IconReference.houseXSmall,
//   );

//   final leaseBreadcrumb = Breadcrumb(
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
