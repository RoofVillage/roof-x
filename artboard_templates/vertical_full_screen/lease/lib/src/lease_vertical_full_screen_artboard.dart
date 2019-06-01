import 'package:flutter/material.dart';
import 'package:input_dock_builder/index.dart';
import 'package:key_value_row_builder/index.dart';
import 'package:table_builder/index.dart';
import 'package:theme/index.dart';
import 'package:icon_library/index.dart';
import 'package:key_value_builder/index.dart';
import 'package:tabbed_fullscreen_artboard_template/index.dart';
import 'package:tabbed_container_builder/index.dart';
import 'package:button_builder/index.dart';
import 'package:button_status_option/index.dart';
import 'package:cells_list_view_builder/index.dart';

abstract class LeaseVerticalFullScreenArtboard
    extends TabbedFullScreenArtboard
    with
        RoofTabbedContainerBuilder,
        RoofCellsListViewBuilder,
        KeyValueRowBuilder,
        InputDockBuilder,
        SecondaryCenterButtonBuilder,
        KeyValueBuilder {
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
  List<RoofTab> buildTabs(BuildContext context) {
    // TODO implement onTap passing to action buttons

    final tenantsActionButton = buildSecondaryCenterButton(
      context,
      text: "Add tenant",
      icon: IconReference.inviteXSmall,
      onTap: (context) => print("add tenant tapped"),
      status: ButtonStatusOption.ready,
    );

    final tenantsList = buildCellsList(
      context,
      children: buildTenantsCells(context),
      button: tenantsActionButton,
    );

    final eventCell = RoofThreadEventCell(
      timestamp: 1558229172,
      title: "Event title",
      note: "Did an event here's a note bishhh",
      iconReference: IconReference.livingRoom,
      details: [
        buildKeyValue(
          context,
          title: "Permission to enter",
          value: "Fuck yea",
        ),
        buildKeyValue(
          context,
          title: "Another detail",
          value: "Detail value",
        ),
        buildKeyValue(
          context,
          title: "Another detail 222",
          value: "Detail value 222",
        ),
        buildKeyValue(
          context,
          title: "more shit",
          value:
              "Detail value 222 asdf asdf asdfasdf alkjlkj asdfasdf alkjlkj asdfasdf alkjlkj",
        )
      ],
    );

    final threadList = buildCellsList(
      context,
      children: [eventCell, eventCell],
      reversed: true,
    );

    final invoicesActionButton = buildSecondaryCenterButton(
      context,
      text: "Create invoice",
      icon: IconReference.invoiceXSmall,
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
      icon: IconReference.threadXSmall,
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

    return [
      RoofTab(
        title: "Thread",
        view: threadList,
        hasDock: true,
      ),
      RoofTab(
        title: "Invoices",
        view: invoicesList,
      ),
      RoofTab(
        title: "Tenants",
        view: tenantsList,
        hasDock: true,
      ),
      RoofTab(
        title: "Messages",
        view: messagesList,
        hasDock: true,
      ),
      RoofTab(
        title: "Maintenance",
        view: maintenanceList,
      ),
    ];
  }
}
