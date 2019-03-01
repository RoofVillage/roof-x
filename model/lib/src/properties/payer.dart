import '../utils/index.dart';

import 'bank_owner_reference.dart';

class Payer extends Mappable {
  final BankOwnerReference bankOwner;
  final int paid;
  final int expected;

  Payer({this.bankOwner, this.paid, this.expected});

  factory Payer.fromMap(Map<String, Object> map) {
    return Payer(
        bankOwner: BankOwnerReference.fromMap(map[Key.bankOwner]),
        paid: map[Key.paid],
        expected: map[Key.expected]);
  }

  @override
  Map<String, Object> toMap() {
    return {
      Key.bankOwner: bankOwner.toMap(),
      Key.paid: paid,
      Key.expected: expected
    };
  }
}
