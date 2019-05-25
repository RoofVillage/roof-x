import 'package:flutter/material.dart';
import 'package:navigator/index.dart';
import 'package:navigable_object_table_artboard_template/index.dart';
import 'package:icon_library/index.dart';
import 'package:breadcrumb_stack_builder/index.dart';
import 'package:key_value_row_builder/index.dart';
import 'package:tabbed_container_builder/index.dart';
import 'package:theme/index.dart';
import 'package:table_builder/index.dart';
import 'package:padded_list_builder/index.dart';

class SandboxVerticalFullScreenArtboard
    extends NavigableObjectFullScreenArtboard with PaddedListBuilder {
  final String title = "Invoice due soon yaa";

  @override
  List<Widget> buildActionButtons(BuildContext context) {
    final theme = RoofTheme.of(context);
    return [
      IconReference.more.buildSvg(color: theme.color.icon.nav),
    ];
  }

  @override
  Widget buildNavButton(BuildContext context) {
    final theme = RoofTheme.of(context);
    return IconReference.backArrowNav.buildSvg(color: theme.color.icon.nav);
  }

  @override
  List<RoofBreadcrumb> buildBreadcrumbs(BuildContext context) {
    return [
      RoofBreadcrumb(
        title: "2720 W Lamar Road",
        iconReference: IconReference.houseXSmall,
      ),
      RoofBreadcrumb(
        title: "House Manager Lease (2019-2020)",
        iconReference: IconReference.leaseXSmall,
      )
    ];
  }

  @override
  List<KeyValueRow> buildInfoRows(BuildContext context) {
    return [
      KeyValueRow(title: "Total", value: "\$1,400.00"),
      KeyValueRow(title: "Paid", value: "\$800.00"),
      KeyValueRow(title: "Still owed", value: "\$600.00"),
      KeyValueRow(title: "Payable", value: "Payable now"),
      KeyValueRow(title: "Due", value: "June 1, 2019"),
      KeyValueRow(title: "Payment profile", value: "Lamar Checking Account")
    ];
  }

  @override
  List<RoofTab> buildTabs(BuildContext context) {
    final leaseCell = LeaseCell(
      name: "2019-2020 Lease",
      tenants: [
        "Lisa Balzac",
        "Dina Jojojo",
        "Hana Rafalawski",
      ],
      rentAmount: 1450,
      startTimestamp: 1552708014,
      endTimestamp: 1557978442,
      status: LeaseStatus.active,
    );

    final tenantCell1 = TenantCell(
      name: "Joey mufu",
      inviteSentTo: "buttnut@email.io",
      inviteKey: "seahorse69420",
    );

    final tenantCell2 = TenantCell(
      name: "Joey mufu",
      joinTimestamp: 1557978442,
    );

    final invoiceCell = InvoiceCell(
      name: "Rent",
      dueTimestamp: 1557978442,
      totalAmount: 1240,
      unpaidAmount: 760,
      invoiceStatus: InvoiceStatus.unpaid,
      invoiceType: InvoiceType.rent,
    );

    final paymentCell = PaymentCell(
      tenant: "Jo bobo",
      amount: 1320,
      timestamp: 1557999442,
      note: "Just some money for u",
      paymentStatus: PaymentStatus.processed,
    );

    final messageCell = MessageCell(
      subject: "New yard flamingo looks gud",
      latestActivityTimestamp: 1557978442,
      message:
          "Just wanted to say y'all it really looks fire af, yard is the best on the block, get more plastic birds plz luv u lots homiez",
    );

    final maintenanceRequestCell = MaintenaceRequestCell(
      name: "Racoons up in this bitch",
      receivedTimestamp: 1557978442,
      status: MaintenanceRequestStatus.open,
    );

    final homeCell = HomeCell(
      address: "1440 Collegeview Ave",
      unit: "Apt B",
      activeLeases: [
        RoofLeasePreview(
          title: "2018-2019 lease",
          amount: 2000,
          startTimestamp: 1552708014,
          endTimestamp: 1557978442,
          status: TenantStatus.ready,
        ),
        RoofLeasePreview(
          title: "2018-2019 Lease",
          amount: 1070,
          startTimestamp: 1552708014,
          endTimestamp: 1557978442,
          status: TenantStatus.pending,
        )
      ],
      inactiveLeases: [
        RoofLeasePreview(
          title: "2019-2020 lease",
          amount: 1140,
          startTimestamp: 1552708014,
          endTimestamp: 1557978442,
          status: TenantStatus.pending,
        ),
      ],
      tags: [
        "students",
        "pets",
      ],
    );

    final List<Widget> homesCells = [
      homeCell,
      homeCell,
      homeCell,
      homeCell,
      homeCell,
      homeCell,
      homeCell,
    ];
    final homesView = buildPaddedList(context, children: homesCells);

    final List<Widget> paymentsCells = [
      paymentCell,
      paymentCell,
      paymentCell,
      paymentCell,
      paymentCell,
      paymentCell,
      paymentCell,
    ];
    final paymentsView = buildPaddedList(context, children: paymentsCells);

    final List<Widget> invoicesCells = [
      invoiceCell,
      invoiceCell,
      invoiceCell,
      invoiceCell,
      invoiceCell,
      invoiceCell,
      invoiceCell,
    ];
    final invoicesView = buildPaddedList(context, children: invoicesCells);

    final List<Widget> messagesCells = [
      messageCell,
      messageCell,
      messageCell,
      messageCell,
      messageCell,
      messageCell,
      LoadMoreCell()
    ];
    final messagesView = buildPaddedList(context, children: messagesCells);

    final List<Widget> maintenanceCells = [
      maintenanceRequestCell,
      maintenanceRequestCell,
      maintenanceRequestCell,
      maintenanceRequestCell,
      maintenanceRequestCell,
      maintenanceRequestCell,
    ];
    final maintenanceView =
        buildPaddedList(context, children: maintenanceCells);

    final List<Widget> leasesCells = [
      leaseCell,
      leaseCell,
      leaseCell,
      leaseCell,
      leaseCell,
      leaseCell,
      leaseCell,
    ];
    final leasesView = buildPaddedList(context, children: leasesCells);

    final emptyView = buildPaddedList(context, children: [
      EmptyMessageCell(text: "Nothing to see",)
    ]);

    final List<Widget> tenantsCells = [
      tenantCell1,
      tenantCell2,
      tenantCell1,
      tenantCell2,
      tenantCell1,
      tenantCell2,
      tenantCell1,
      tenantCell2,
    ];
    final tenantsView = buildPaddedList(context, children: tenantsCells);

    return [
      RoofTab(title: "Messages", view: messagesView),
      RoofTab(title: "Payments", view: paymentsView),
      RoofTab(title: "Tenants", view: tenantsView),
      RoofTab(title: "Invoices", view: invoicesView),
      RoofTab(title: "Maintenance", view: maintenanceView),
      RoofTab(title: "Properties", view: homesView),
      RoofTab(title: "Empty", view: emptyView),
      RoofTab(title: "Leases", view: leasesView),
    ];
  }
}
