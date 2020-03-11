import 'dart:async';

mixin DomainsArtboardData {
  String get artboardTitle => null;

  final profilesStream = Stream.value(
    ServiceProfilesView(
      profiles: [
        ServiceProfile("Tyler Hayes", 7),
        ServiceProfile("Mills Rentals", null),
        ServiceProfile("GN Company", 2),
      ],
    ),
  );

  final transfersStream = Stream.value(
    RecentTransfersView([
      Transfer(
        amount: 12.69,
        sender: 'Jo',
        date: DateTime.now(),
        note: 'Take this bread and buy some bread',
      ),
      Transfer(
        amount: 2015,
        receiver: 'Mills',
        date: DateTime.now(),
        note: 'Enjoy your rent ya fuckin asshole',
      ),
      Transfer(
        amount: 420,
        sender: 'Mills',
        date: DateTime.now(),
        note: 'Refund a bitch',
      ),
      Transfer(
        amount: 12.69,
        sender: 'Jo',
        date: DateTime.now(),
        note: 'Take this bread and buy some bread',
      ),
      Transfer(
        amount: 2015,
        receiver: 'Mills',
        date: DateTime.now(),
        note: 'Enjoy your rent ya fuckin asshole',
      ),
      Transfer(
        amount: 420,
        sender: 'Mills',
        date: DateTime.now(),
        note: 'Refund a bitch',
      ),
    ]),
  );
}

class ServiceProfilesView {
  List<ServiceProfile> profiles;

  ServiceProfilesView({this.profiles});
}

class ServiceProfile {
  String name;
  int notificationCount;

  ServiceProfile(
    this.name,
    this.notificationCount,
  );
}

class RecentTransfersView {
  List<Transfer> transfers;

  RecentTransfersView(this.transfers);
}

class Transfer {
  final double amount;
  final String sender;
  final String receiver;
  final DateTime date;
  final String note;

  // sender/receiver only supplied if they are not the current user

  Transfer({
    this.amount,
    this.sender,
    this.receiver,
    this.date,
    this.note,
  });
}
