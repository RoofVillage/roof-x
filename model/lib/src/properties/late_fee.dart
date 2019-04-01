import '../mixins/index.dart';
import '../key.dart' as _key;

class LateFee with Mappable {
  final int amount;
  final int numDaysWhenLate;

  LateFee({this.amount, this.numDaysWhenLate});

  factory LateFee.fromMap(Map<String, Object> map) {
    if (map == null) return null;

    return LateFee(
        amount: map[_key.amount], numDaysWhenLate: map[_key.numDaysWhenLate]);
  }

  @override
  Map<String, Object> toMap() {
    return {_key.amount: amount, _key.numDaysWhenLate: numDaysWhenLate};
  }
}
