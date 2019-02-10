import '../utils/index.dart';

class LateFee extends Mappable {
  final int amount;
  final int numDaysWhenLate;

  LateFee({this.amount, this.numDaysWhenLate});

  factory LateFee.fromMap(Map<String, Object> map) {
    return LateFee(
        amount: map[Key.amount], numDaysWhenLate: map[Key.numDaysWhenLate]);
  }

  @override
  Map<String, Object> toMap() {
    return {Key.amount: amount, Key.numDaysWhenLate: numDaysWhenLate};
  }
}
