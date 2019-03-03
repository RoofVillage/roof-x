import '../utils/index.dart';

import 'bank_owner_reference.dart';

class Splitter extends Mappable {
  final BankOwnerReference bankOwner;
  final int percentage;

  Splitter({this.bankOwner, this.percentage});

  factory Splitter.fromMap(Map<String, Object> map) {
    return Splitter(
        bankOwner: BankOwnerReference.fromMap(map[Key.bankOwner]),
        percentage: map[Key.percentage]);
  }

  @override
  Map<String, Object> toMap() {
    return {Key.bankOwner: bankOwner.toMap(), Key.percentage: percentage};
  }
}
