import 'package:one_to_one_transaction/index.dart';

class Settlement extends OneToOneTransaction {
  factory Settlement.fromMap(Map<String, Object> map) {
    return OneToOneTransaction.fromMap(map);
  }
}
