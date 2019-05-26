import 'package:flutter/material.dart';
import 'package:navigator/index.dart';
import 'package:invoice_full_screen_artboard_template/index.dart';
import 'package:table_builder/index.dart';

class InvoiceArtboard extends InvoiceVerticalFullScreenArtboard {
  @override
  String get invoiceTitle => "Invoice due June 1";  

  @override
  String get homeTitle => "200 S Dawson St. Apt. B";

  @override
  String get leaseTitle => "2018-19 Lease";

  @override
  int get daysPayableIn => 12;

  @override
  int get dueTimestamp => 1554708014;

  @override
  int get totalAmount => 120000;

  @override
  int get paidAmount => 120000;

  @override
  int get unpaidAmount => 0;

  @override
  String get paymentProfile => "donny's bank";

  @override
  List<Widget> buildPaymentsCells(BuildContext context) {
    final paymentCell = PaymentCell(
      amount: 120000,
      tenant: "Big shawn",
      timestamp: 1552708014,
      note: "Sendin u some munnis for this hoosie",
      paymentStatus: PaymentStatus.manual,
    );

    return [
      paymentCell,
      paymentCell,
      paymentCell,
      paymentCell,
      paymentCell,
      paymentCell,
      paymentCell,
    ];
  }
}
