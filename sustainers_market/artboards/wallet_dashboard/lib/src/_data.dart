import 'dart:async';

import 'dart:math';

import 'package:dwolla_types/index.dart';
import 'package:faker/faker.dart';

mixin WalletDashboardArtboardData {
  static _randomTransferCell({TransferStatus transferStatus}) {
    String sender;
    String receiver;

    if (Random().nextBool()) {
      sender = faker.person.name();
    } else {
      receiver = faker.person.name();
    }

    return Transfer(
      amount: (Random().nextInt(299) * 10).toDouble(),
      sender: sender,
      receiver: receiver,
      date: DateTime.now(),
      note: faker.lorem.words(Random().nextInt(12)).join(" "),
      transferStatus: transferStatus,
    );
  }

  static _randomPaymentStatus() {
    final notProcessingStatuses = TransferStatus.values
        .where(
          (value) => value != TransferStatus.pending,
        )
        .toList();
    return notProcessingStatuses[Random().nextInt(
      notProcessingStatuses.length,
    )];
  }

  final walletOverviewStream = Stream.value(
    WalletOverview(
      balance: 850000,
      status: WalletVerificationStatus.unverified,
    ),
  );

  final transfersStream = Stream.value(
    RecentTransfersView(
      List.generate(
        20,
        (index) => _randomTransferCell(
          transferStatus:
              index < 4 ? TransferStatus.pending : _randomPaymentStatus(),
        ),
      ),
    ),
  );
}

class RecentTransfersView {
  List<Transfer> transfers;

  RecentTransfersView(this.transfers);
}

class Transfer {
  final String domain;
  final double amount;
  final String sender;
  final String receiver;
  final DateTime date;
  final String note;
  final TransferStatus transferStatus;

  // sender/receiver only supplied if they are not the current user

  Transfer({
    this.domain,
    this.amount,
    this.sender,
    this.receiver,
    this.date,
    this.note,
    this.transferStatus,
  });
}

class WalletOverview {
  final double balance; // in USD?
  final WalletVerificationStatus status;

  WalletOverview({
    this.balance,
    this.status,
  });
}
