import '../utils/index.dart';

import '_bank_owner.dart';

class Balance extends Mappable {
  final int aOwesB;
  final BankOwner bankOwnerA;
  final BankOwner bankOwnerB;

  Balance({this.aOwesB, this.bankOwnerA, this.bankOwnerB});

  factory Balance.fromMap(Map<String, Object> map) {
    return Balance(
        aOwesB: map[Key.guid],
        bankOwnerA: BankOwner.fromMap(map[Key.bankOwnerA]),
        bankOwnerB: BankOwner.fromMap(map[Key.bankOwnerB]));
  }

  @override
  Map<String, Object> toMap() {
    return {
      Key.aOwesB: aOwesB,
      Key.bankOwnerA: bankOwnerA.toMap(),
      Key.bankOwnerB: bankOwnerB.toMap()
    };
  }
}
