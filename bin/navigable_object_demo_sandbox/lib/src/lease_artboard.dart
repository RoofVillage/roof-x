import 'package:flutter/material.dart';
import 'package:navigator/index.dart';
import 'package:icon_library/index.dart';
import 'package:lease_full_screen_artboard_template/index.dart';
import 'package:table_builder/index.dart';
import 'package:key_value_builder/index.dart';

class LeaseArtboard extends LeaseVerticalFullScreenArtboard with KeyValueBuilder {
  @override
  String get homeTitle => "200 S Dawson St. Apt. B";

  @override
  String get leaseTitle => "2018-19 Lease";

  @override
  int get totalAmount => 1200000;

  @override
  bool get continueInvoices => true;

  @override
  int get daysUntilLateFee => 5;

  @override
  int get lateFeeAmount => 5000;

  @override
  String get dueSchedule => "Due every month on the 1st";

  @override
  int get startTimestamp => 1552708014;

  @override
  int get endTimestamp => 1562708014;

  @override
  String get paymentProfile => "Denny's big bank";

  @override
  String get transactionFee => "You pay";

  @override
  List<Widget> buildInvoicesCells(BuildContext context) {
    final invoiceCell = InvoiceCell(
      name: "Rent due June 1",
      totalAmount: 120000,
      unpaidAmount: 120000,
      dueTimestamp: 1552728014,
      invoiceType: InvoiceType.rent,
      invoiceStatus: InvoiceStatus.unpaid,
    );

    return [
      invoiceCell,
      invoiceCell,
      invoiceCell,
      invoiceCell,
      invoiceCell,
      invoiceCell,
      invoiceCell,
    ];
  }

  @override
  List<Widget> buildMaintenanceCells(BuildContext context) {
    final maintenanceCell = MaintenanceCell(
      name: "Raccoons gettin it in the attic",
      note: "Need these scritchy scratchy boiz GONE PLz",
      receivedTimestamp: 1552721280,
      status: MaintenanceRequestStatus.emergency,
    );

    return [
      maintenanceCell,
      maintenanceCell,
      maintenanceCell,
      maintenanceCell,
      maintenanceCell,
      maintenanceCell,
      maintenanceCell,
    ];
  }

  @override
  List<Widget> buildMessagesCells(BuildContext context) {
    final messageCell = MessageCell(
      subject: "Thinkin about growing pot",
      message: "Is this illegal? Downt o profit share ya dig",
      latestActivityTimestamp: 1552728280,
    );

    return [
      messageCell,
      messageCell,
      messageCell,
      messageCell,
      messageCell,
      messageCell,
      messageCell,
    ];
  }

  @override
  List<Widget> buildTenantsCells(BuildContext context) {
    final tenantCell = TenantCell(
      name: "Big shawn",
      inviteKey: "swag9000",
      joinTimestamp: 1542728917,
      inviteSentTo: "shawnz@mail.com",
    );

    return [
      tenantCell,
      tenantCell,
    ];
  }

  @override
  List<Widget> buildThreadCells(BuildContext context) {
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
    return [eventCell, eventCell];
  }
}
