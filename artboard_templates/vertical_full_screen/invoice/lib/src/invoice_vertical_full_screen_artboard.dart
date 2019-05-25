import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:icon_library/index.dart';
import 'package:navigable_object_table_artboard_template/index.dart';
import 'package:breadcrumb_stack_builder/index.dart';
import 'package:tabbed_container_builder/index.dart';
// import 'package:key_value_row_builder/index.dart';
import 'package:padded_list_builder/index.dart';

abstract class InvoiceVerticalFullScreenArtboard
    extends NavigableObjectFullScreenArtboard
    with RoofTabbedContainerBuilder, PaddedListBuilder {
  RoofBreadcrumb get homeBreadcrumb;
  RoofBreadcrumb get leaseBreadcrumb;
  // List<KeyValueRow> get infoRows;

  List<Widget> buildPaymentsCells(BuildContext context);

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
    return [leaseBreadcrumb, homeBreadcrumb];
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

  // @override
  // buildInfoRows(BuildContext context) {
  //   return infoRows;
  // }
}
