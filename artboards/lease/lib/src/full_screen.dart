import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:navigation_icon_library/index.dart';
import 'package:x_small_icon_library/index.dart';
import 'package:tabbed_fullscreen_artboard_template/index.dart';
import 'package:button_builder/index.dart';
import 'package:button_status_option/index.dart';
import 'package:cells_list_view_builder/index.dart';
import 'package:thread_list_view_builder/index.dart';
import 'package:auxiliary_widget_builder/index.dart';
import 'package:tab/index.dart';

import '_data.dart';

abstract class LeaseVerticalFullScreenArtboard extends TabbedFullScreenArtboard
    with
        RoofCellsListViewBuilder,
        RoofThreadListViewBuilder,
        SecondaryCenterButtonBuilder,
        LeaseArtboardBuilder,
        AddFileAuxiliaryWidgetBuilder {
  // TODO convert this to accept data objects instead of widgets, build cells here
  List<Widget> buildThreadCells(BuildContext context);
  List<Widget> buildTenantsCells(BuildContext context);
  List<Widget> buildInvoicesCells(BuildContext context);
  List<Widget> buildMaintenanceCells(BuildContext context);
  List<Widget> buildMessagesCells(BuildContext context);

  @override
  String get title => leaseTitle;

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

  @override
  List<RoofTab> buildTabs(BuildContext context) {
    // TODO implement onTap passing to action buttons

    final tenantsActionButton = buildSecondaryCenterButton(
      context,
      text: "Add tenant",
      icon: XSmallIcon.invite,
      onTap: (context) => print("add tenant tapped"),
      status: ButtonStatusOption.ready,
    );

    final tenantsList = buildCellsList(
      context,
      children: buildTenantsCells(context),
      button: tenantsActionButton,
    );

    final threadList = buildThreadList(
      context,
      children: buildThreadCells(context),
    );

    final invoicesActionButton = buildSecondaryCenterButton(
      context,
      text: "Create invoice",
      icon: XSmallIcon.invoice,
      onTap: (context) => print("add invoice tapped"),
      status: ButtonStatusOption.ready,
    );

    final invoicesList = buildCellsList(
      context,
      children: buildInvoicesCells(context),
      button: invoicesActionButton,
    );

    final messagesActionButton = buildSecondaryCenterButton(
      context,
      text: "New message",
      icon: XSmallIcon.thread,
      onTap: (context) => print("new message tapped"),
      status: ButtonStatusOption.ready,
    );

    final messagesList = buildCellsList(
      context,
      children: buildMessagesCells(context),
      button: messagesActionButton,
    );

    final maintenanceList = buildCellsList(
      context,
      children: buildMaintenanceCells(context),
    );

    final addFileAuxiliaryWidget = buildAddFileAuxiliaryWidget(context);

    return [
      RoofTab(
        title: "Thread",
        view: threadList,
        dockData: TabDockData(
          auxiliaryWidgets: [addFileAuxiliaryWidget],
        ),
      ),
      RoofTab(
        title: "Invoices",
        view: invoicesList,
      ),
      RoofTab(
        title: "Tenants",
        view: tenantsList,
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
