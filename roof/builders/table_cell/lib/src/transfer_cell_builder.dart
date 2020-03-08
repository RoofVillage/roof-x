import 'package:flutter/material.dart';
import 'package:roof_table_cell_builder/src/_components/transfer_cell.dart';

mixin TransferCellBuilder {
  TransferCell buildTransferCell({
    @required double amount,
    @required DateTime date,
    String sender,
    String receiver,
    String note,
    void Function() onTap,
  }) =>
      TransferCell(
        amount: amount,
        date: date,
        sender: sender,
        receiver: receiver,
        note: note,
        onTap: onTap,
      );
}
