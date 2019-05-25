import 'package:flutter/material.dart';
import 'package:navigator/index.dart';
import 'package:navigable_object_table_artboard_template/index.dart';
import 'package:icon_library/index.dart';
import 'package:breadcrumb_stack_builder/index.dart';
import 'package:key_value_row_builder/index.dart';
import 'package:tabbed_container_builder/index.dart';
import 'package:theme/index.dart';
import 'package:table_builder/index.dart';
import 'package:distance/index.dart' as distance;

class InvoiceVerticalFullScreenArtboard
    extends NavigableObjectFullScreenArtboard {
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

  final List<RoofBreadcrumb> breadcrumbs = [
    RoofBreadcrumb(
      title: "2720 W Lamar Road",
      iconReference: IconReference.houseXSmall,
    ),
    RoofBreadcrumb(
      title: "House Manager Lease (2019-2020)",
      iconReference: IconReference.leaseXSmall,
    )
  ];

  final List<KeyValueRow> infoRows = [
    KeyValueRow(title: "Total", value: "\$1,400.00"),
    KeyValueRow(title: "Paid", value: "\$800.00"),
    KeyValueRow(title: "Still owed", value: "\$600.00"),
    KeyValueRow(title: "Payable", value: "Payable now"),
    KeyValueRow(title: "Due", value: "June 1, 2019"),
    KeyValueRow(title: "Payment profile", value: "Lamar Checking Account")
  ];

  @override
  List<RoofTab> buildTabs(BuildContext context) {
    final theme = RoofTheme.of(context);

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

    final homesView = Container(
      padding: EdgeInsets.only(
        left: distance.b,
        right: distance.b,
      ),
      color: theme.color.background.generalSecondary,
      child: ListView(
        padding: EdgeInsets.only(bottom: distance.c),
        children: [
          homeCell,
          homeCell,
          homeCell,
          homeCell,
          homeCell,
          homeCell,
          homeCell,
        ],
      ),
    );

    final invoicesView = Container(
      padding: EdgeInsets.only(
        left: distance.b,
        right: distance.b,
      ),
      color: theme.color.background.generalSecondary,
      child: ListView(
        padding: EdgeInsets.only(bottom: distance.c),
        children: [
          invoiceCell,
          invoiceCell,
          invoiceCell,
          invoiceCell,
          invoiceCell,
          invoiceCell,
          invoiceCell,
        ],
      ),
    );

    final messagesView = Container(
      padding: EdgeInsets.only(
        left: distance.b,
        right: distance.b,
      ),
      color: theme.color.background.generalSecondary,
      child: ListView(
        padding: EdgeInsets.only(bottom: distance.c),
        children: [
          messageCell,
          messageCell,
          messageCell,
          messageCell,
          messageCell,
          messageCell,
          LoadMoreCell()
        ],
      ),
    );

    final maintenanceView = Container(
      padding: EdgeInsets.only(
        left: distance.b,
        right: distance.b,
      ),
      color: theme.color.background.generalSecondary,
      child: ListView(
        padding: EdgeInsets.only(bottom: distance.c),
        children: [
          maintenanceRequestCell,
          maintenanceRequestCell,
          maintenanceRequestCell,
          maintenanceRequestCell,
          maintenanceRequestCell,
          maintenanceRequestCell,
        ],
      ),
    );

    final leasesView = Container(
      padding: EdgeInsets.only(
        left: distance.b,
        right: distance.b,
      ),
      color: theme.color.background.generalSecondary,
      child: ListView(
        padding: EdgeInsets.only(bottom: distance.c),
        children: [
          leaseCell,
          leaseCell,
          leaseCell,
          leaseCell,
          leaseCell,
          leaseCell,
          leaseCell,
        ],
      ),
    );

    final tenantsView = Container(
      padding: EdgeInsets.only(
        left: distance.b,
        right: distance.b,
      ),
      color: theme.color.background.generalSecondary,
      child: ListView(
        padding: EdgeInsets.only(bottom: distance.c),
        children: [
          tenantCell1,
          tenantCell2,
          tenantCell1,
          tenantCell2,
          tenantCell1,
          tenantCell2,
          tenantCell1,
          tenantCell2,
        ],
      ),
    );

    return [
      RoofTab(title: "Messages", view: messagesView),
      RoofTab(title: "Tenants", view: tenantsView),
      RoofTab(title: "Invoices", view: invoicesView),
      RoofTab(title: "Maintenance", view: maintenanceView),
      RoofTab(title: "Properties", view: homesView),
      RoofTab(title: "Leases", view: leasesView),
    ];
  }
}
