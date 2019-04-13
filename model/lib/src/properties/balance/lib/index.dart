import 'package:bank_owner_reference/index.dart';
import 'package:mappable/index.dart';
import 'package:key/index.dart' as _key;

class Balance with Mappable {
  final int aOwesB;
  final BankOwnerReference bankOwnerA;
  final BankOwnerReference bankOwnerB;

  Balance({this.aOwesB, this.bankOwnerA, this.bankOwnerB});

  factory Balance.fromMap(Map<String, Object> map) {
    return Balance(
        aOwesB: map[_key.guid],
        bankOwnerA: BankOwnerReference.fromMap(map[_key.bankOwnerA]),
        bankOwnerB: BankOwnerReference.fromMap(map[_key.bankOwnerB]));
  }

  @override
  Map<String, Object> toMap() {
    return {
      _key.aOwesB: aOwesB,
      _key.bankOwnerA: bankOwnerA.toMap(),
      _key.bankOwnerB: bankOwnerB.toMap()
    };
  }
}
