import 'package:bank_owner_reference/index.dart';
import 'package:key/index.dart' as _key;
import 'package:mappable/index.dart';

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
