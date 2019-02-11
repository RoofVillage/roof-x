import '../utils/index.dart';

import 'bank_owner_reference.dart';

class Balance extends Mappable {
  final int aOwesB;
  final BankOwnerReference bankOwnerA;
  final BankOwnerReference bankOwnerB;

  Balance({this.aOwesB, this.bankOwnerA, this.bankOwnerB});

  factory Balance.fromMap(Map<String, Object> map) {
    return Balance(
        aOwesB: map[Key.guid],
        bankOwnerA: BankOwnerReference.fromMap(map[Key.bankOwnerA]),
        bankOwnerB: BankOwnerReference.fromMap(map[Key.bankOwnerB]));
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
