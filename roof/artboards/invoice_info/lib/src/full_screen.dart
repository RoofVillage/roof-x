import 'package:flutter/material.dart';
import 'package:key_value_row_builder/index.dart';
import 'package:spaced_column_vertical_floating_artboard_template/index.dart';
import 'package:button_builder/index.dart';
import 'package:mask/index.dart';
import 'package:breadcrumb_builder/index.dart';
import 'package:x_small_icon_library/index.dart';
import 'package:caret_wrap_builder/index.dart';

import '_data.dart';

abstract class InvoiceInfoVerticalFloatingArtboard
    extends SpacedColumnVerticalFloatingArtboard
    with
        SecondaryCenterButtonBuilder,
        InvoiceInfoArtboardData,
        KeyValueRowBuilder,
        BreadcrumbBuilder,
        CaretWrapBuilder {
  String get title => invoiceTitle;

  @override
  List<Widget> buildBody(BuildContext context) {
    final List<Widget> children = [];

    final homeBreadcrumb = buildBreadcrumb(
      context,
      title: homeTitle,
      iconReference: XSmallIcon.house,
    );

    final leaseBreadcrumb = buildBreadcrumb(
      context,
      title: leaseTitle,
      iconReference: XSmallIcon.lease,
    );

    final Widget breadcrumbs = GestureDetector(
      onTap: () => print('take me to home or lease!'),
      child: buildCaretWrap(
        context,
        children: [homeBreadcrumb, leaseBreadcrumb],
      ),
    );

    children.add(breadcrumbs);

    final totalAmountInfoRow = buildKeyValueRow(
      context,
      title: "Rent amount",
      value: applyMask(
        MaskOption.money,
        text: totalAmount.toString(),
        context: context,
      ),
    );
    children.add(totalAmountInfoRow);

    final paidAmountInfoRow = buildKeyValueRow(
      context,
      title: "Paid",
      value: applyMask(
        MaskOption.money,
        text: paidAmount.toString(),
        context: context,
      ),
    );
    children.add(paidAmountInfoRow);

    final owedAmountInfoRow = buildKeyValueRow(
      context,
      title: "Still owed",
      value: applyMask(
        MaskOption.money,
        text: unpaidAmount.toString(),
        context: context,
      ),
    );
    children.add(owedAmountInfoRow);

    final payableInfoRow = buildKeyValueRow(
      context,
      title: "Payable",
      value:
          daysPayableIn > 0 ? "Payable in $daysPayableIn days" : "Payable now",
    );
    children.add(payableInfoRow);

    final paymentProfileInfoRow = buildKeyValueRow(
      context,
      title: "Payment profile",
      value: paymentProfile,
    );
    children.add(paymentProfileInfoRow);

    return children;
  }

  @override
  List<Widget> buildButtons(BuildContext context) {
    _goToEditArtboard() {
      // TODO nav to edit invoice form
    }

    final editButton = buildSecondaryCenterButton(
      context,
      text: "Edit invoice",
      onTap: _goToEditArtboard,
    );

    return [editButton];
  }
}
