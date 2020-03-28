import 'package:dwolla_types/index.dart';
import 'package:flutter/material.dart';

import '_cells/transfer_cell.dart';

mixin TransferCellBuilder {
  TransferCell buildTransferCell({
    @required double amount,
    @required DateTime date,
    String domain,
    String sender,
    String receiver,
    String note,
    TransferStatus transferStatus,
    void Function() onTap,
  }) =>
      TransferCell(
        amount: amount,
        domain: domain,
        date: date,
        sender: sender,
        receiver: receiver,
        note: note,
        transferStatus: transferStatus,
        onTap: onTap,
      );
}
