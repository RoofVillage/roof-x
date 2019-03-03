import '../abstract/index.dart';

class Settlement extends OneToOneTransaction {
  factory Settlement.fromMap(Map<String, Object> map) {
    return OneToOneTransaction.fromMap(map);
  }
}
