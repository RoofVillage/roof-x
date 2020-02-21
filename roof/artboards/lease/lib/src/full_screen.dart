import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:navigation_icon_library/index.dart';
import 'package:x_small_icon_library/index.dart';
import 'package:tabbed_fullscreen_artboard_template/index.dart';
import 'package:button_builder/index.dart';
import 'package:button_status_option/index.dart';
import 'package:spaced_list_view_builder/index.dart';
import 'package:thread_list_view_builder/index.dart';
import 'package:auxiliary_widget_builder/index.dart';
import 'package:tab/index.dart';
import 'package:standard_icon_library/index.dart';
import 'package:mask/index.dart';

import '_data.dart';

abstract class LeaseVerticalFullScreenArtboard extends TabbedFullScreenArtboard
    with
        SpacedListViewBuilder,
        ThreadListViewBuilder,
        SecondaryCenterButtonBuilder,
        LeaseArtboardData,
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
  String buildSubtitle(BuildContext context) {
    final amountString = applyMask(
      MaskOption.money,
      text: (totalAmount).toString(),
      context: context,
    );
    return amountString + " due every month on the 1st";
  }

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

    final tenantsList = buildSpacedListView(
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

    final invoicesList = buildSpacedListView(
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

    final messagesList = buildSpacedListView(
      children: buildMessagesCells(context),
      button: messagesActionButton,
    );

    final maintenanceList = buildSpacedListView(
      children: buildMaintenanceCells(context),
    );

    final addFileAuxiliaryWidget = buildAddFileAuxiliaryWidget(context);

    return [
      RoofTab(
        title: "Thread",
        view: threadList,
        icon: StandardIcon.thread,
        dockData: TabDockData(
          auxiliaryWidgets: [addFileAuxiliaryWidget],
        ),
      ),
      RoofTab(
        title: "Invoices",
        icon: StandardIcon.cashSack,
        view: invoicesList,
      ),
      RoofTab(
        title: "Maintenance",
        icon: StandardIcon.toolbox,
        view: maintenanceList,
      ),
      RoofTab(
        title: "Messages",
        icon: StandardIcon.comment,
        view: messagesList,
      ),
      RoofTab(
        title: "Tenants",
        icon: StandardIcon.tenant,
        view: tenantsList,
      ),
    ];
  }
}
