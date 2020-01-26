import 'package:flutter/material.dart';
import 'package:navigator/index.dart';
import 'package:standard_icon_library/index.dart';
import 'package:lease_full_screen_artboard_template/index.dart'; 
import 'package:table_builder/index.dart';
import 'package:invoice_options/index.dart';
import 'package:key_value_builder/index.dart';

class LeaseArtboard extends LeaseVerticalFullScreenArtboard
    with KeyValueBuilder {
  @override
  String get homeTitle => "200 S Dawson St. Apt. B";

  @override
  String get leaseTitle => "2018-19 Lease";

  @override
  int get totalAmount => 1200;

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
      name: "Rent due June 1 long long long asdf asdf asdf",
      totalAmount: 120000,
      unpaidAmount: 120000,
      dueTimestamp: 1552728014,
      invoiceType: InvoiceType.fromString("contractual"),
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
    final maintenanceCellEmergency = MaintenanceCell(
      name: "Hot water heater is leaking!",
      note:
          "I walked into the garage this morning and noticed a huge puddle of water around the heater, it seems to be still leaking and not sure what to do!",
      receivedTimestamp: 1552821280,
      status: "emergency",
    );
    final maintenanceCellOpen = MaintenanceCell(
      name: "Door lock is sticking",
      note:
          "The lock on the back door seems to be messed up, both of our keys stick in it and it's really hard to turn, I'm worried about breaking the key! We've been using the front door for the time being but please see if you could get it changed soon.",
      receivedTimestamp: 1552721280,
      status: "open",
    );
    final maintenanceCellResolved = MaintenanceCell(
      name: "Microwave stopped working",
      receivedTimestamp: 1552221280,
      status: "closed",
    );

    return [
      maintenanceCellEmergency,
      maintenanceCellOpen,
      maintenanceCellResolved,
    ];
  }

  @override
  List<Widget> buildMessagesCells(BuildContext context) {
    final messageCell = MessageCell(
      subject: "Thinkin about starting a garden",
      message:
          "We'd really love to till a little 10x10 section in the backyard to grow some vegetables, would that be okay?",
      latestActivityTimestamp: 1552728280,
    );

    return [
      messageCell,
    ];
  }

  @override
  List<Widget> buildTenantsCells(BuildContext context) {
    final tenantCell1 = TenantCell(
      name: "Kelsey Lu",
      inviteKey: "bird9301",
      joinTimestamp: 1542728917,
      inviteSentTo: "klu@mail.com",
    );

    final tenantCell2 = TenantCell(
      name: "Lisa Hannigan",
      inviteKey: "mountain0818",
      joinTimestamp: 1542728917,
      inviteSentTo: "lamhann@mail.com",
    );

    return [
      tenantCell1,
      tenantCell2,
    ];
  }

  @override
  List<Widget> buildThreadCells(BuildContext context) {
    final eventCell1 = ThreadEventCell(
      timestamp: 1558229172,
      title: "Kelsey Lu paid \$980 for June rent",
      iconReference: StandardIcon.cashSack,
    );
    final eventCell2 = ThreadEventCell(
      timestamp: 1558229172,
      title: "Lisa Hanniga paid \$910 for June rent",
      iconReference: StandardIcon.cashSack,
    );
    final eventCell3 = ThreadEventCell(
      timestamp: 1558229172,
      title: "Lisa Hannigan created a new message thread",
      note: "Thinking about starting a garden",
      iconReference: StandardIcon.cashSack,
    );
    return [
      eventCell3,
      eventCell2,
      eventCell1,
      eventCell3,
      eventCell2,
      eventCell1,
      eventCell3,
      eventCell2,
      eventCell1,
    ];
  }
}
