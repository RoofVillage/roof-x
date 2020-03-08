import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navigation_icon_library/index.dart';
import 'package:semantic_theme/index.dart';

mixin WalletDashboardArtboardData {
  List<Widget> artboardActionButtons(BuildContext context) => [
        NavigationIcon.add.buildWidget(
          color: SemanticTheme.of(context).color.icon.nav,
        )
      ];

  final walletOverviewStream = Stream.value(
    WalletOverview(
      balance: 850000,
      status: WalletStatus.unverified,
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

class WalletOverview {
  final double balance; // in USD?
  final WalletStatus status;

  WalletOverview({
    this.balance,
    this.status,
  });
}

enum WalletStatus {
  unverified,
  verified,
  retry,
  suspended,
  document,
}
