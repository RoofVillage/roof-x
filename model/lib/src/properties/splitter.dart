import 'bank_owner_reference.dart';
import '../mixins/index.dart';
import '../key.dart' as _key;

class Splitter with Mappable {
  final BankOwnerReference bankOwner;
  final int percentage;

  Splitter({this.bankOwner, this.percentage});

  factory Splitter.fromMap(Map<String, Object> map) {
    return Splitter(
        bankOwner: BankOwnerReference.fromMap(map[_key.bankOwner]),
        percentage: map[_key.percentage]);
  }

  @override
  Map<String, Object> toMap() {
    return {_key.bankOwner: bankOwner.toMap(), _key.percentage: percentage};
  }
}
