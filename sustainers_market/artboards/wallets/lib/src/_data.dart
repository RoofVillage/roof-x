import 'dart:async';

import 'dart:math';

import 'package:dwolla_types/index.dart';
import 'package:faker/faker.dart';
import 'package:table_cell_builder/index.dart';

mixin WalletsArtboardData {
  String get artboardTitle => "Your Wallets";

  static int _randomNotificationCount() {
    return Random.secure().nextBool() ? Random.secure().nextInt(16) : null;
  }

  static List<String> _randomProfileNames = [
    faker.person.name(),
    ...List.generate(
      1 + Random.secure().nextInt(3),
      (_) => faker.company.name(),
    )
  ];

  final profilesStream = Stream.value(
    ServiceProfilesView(
      profiles: _randomProfileNames
          .map(
            (name) => ServiceProfile(
              name: name,
              notificationCount: _randomNotificationCount(),
              ownerIsInScope: _randomProfileNames.first == name,
            ),
          )
          .toList(),
    ),
  );

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
      domain: _randomProfileNames[Random().nextInt(
        _randomProfileNames.length,
      )],
      sender: sender,
      receiver: receiver,
      date: DateTime.now(),
      note: faker.lorem.words(Random().nextInt(12)).join(" "),
      transferStatus: transferStatus,
    );
  }

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

class ServiceProfilesView {
  List<ServiceProfile> profiles;

  ServiceProfilesView({this.profiles});
}

class ServiceProfile {
  String name;
  int notificationCount;
  bool ownerIsInScope;

  ServiceProfile({
    this.name,
    this.notificationCount,
    this.ownerIsInScope,
  });
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
