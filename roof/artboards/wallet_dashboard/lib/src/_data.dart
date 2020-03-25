import 'dart:async';

import 'dart:math';

import 'package:faker/faker.dart';
import 'package:roof_types/index.dart';

mixin WalletDashboardArtboardData {
  static _randomTransferCell({PaymentStatus paymentStatus}) {
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
      paymentStatus: paymentStatus,
    );
  }

  static _randomPaymentStatus() {
    final notProcessingStatuses = PaymentStatus.values
        .where(
          (value) => value != PaymentStatus.pending,
        )
        .toList();
    return notProcessingStatuses[Random().nextInt(
      notProcessingStatuses.length,
    )];
  }

  final walletOverviewStream = Stream.value(
    WalletOverview(
      balance: 850000,
      status: WalletStatus.unverified,
    ),
  );

  final transfersStream = Stream.value(
    RecentTransfersView(
      List.generate(
        20,
        (index) => _randomTransferCell(
          paymentStatus:
              index < 4 ? PaymentStatus.pending : _randomPaymentStatus(),
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
  final PaymentStatus paymentStatus;

  // sender/receiver only supplied if they are not the current user

  Transfer({
    this.domain,
    this.amount,
    this.sender,
    this.receiver,
    this.date,
    this.note,
    this.paymentStatus,
  });
}

class WalletOverview {
  final double balance; // in USD?
  final WalletStatus status;

  WalletOverview({
    this.balance,
    this.status,
  });
}
