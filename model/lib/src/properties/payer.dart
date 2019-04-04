import 'bank_owner_reference.dart';
import '../mixins/index.dart';
import '../key.dart' as _key;

class Payer with Mappable {
  final BankOwnerReference bankOwner;
  final int paid;
  final int expected;

  Payer({this.bankOwner, this.paid, this.expected});

  factory Payer.fromMap(Map<String, Object> map) {
    return Payer(
        bankOwner: BankOwnerReference.fromMap(map[_key.bankOwner]),
        paid: map[_key.paid],
        expected: map[_key.expected]);
  }

  @override
  Map<String, Object> toMap() {
    return {
      _key.bankOwner: bankOwner.toMap(),
      _key.paid: paid,
      _key.expected: expected
    };
  }
}
