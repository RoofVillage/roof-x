import 'package:flutter/material.dart';
import 'package:roof_table_cell_builder/src/_components/transfer_cell.dart';
import 'package:roof_types/index.dart';

mixin TransferCellBuilder {
  TransferCell buildTransferCell({
    @required double amount,
    @required DateTime date,
    String domain,
    String sender,
    String receiver,
    String note,
    PaymentStatus paymentStatus,
    void Function() onTap,
  }) =>
      TransferCell(
        amount: amount,
        domain: domain,
        date: date,
        sender: sender,
        receiver: receiver,
        note: note,
        paymentStatus: paymentStatus,
        onTap: onTap,
      );
}
