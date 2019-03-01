import 'package:types/index.dart';
import '../utils/index.dart';

import 'name_payment_profile.dart';

class PaymentDefault extends Mappable {
  final PaymentDefaultType type;
  final NamePaymentProfile namePaymentProfile;
  final String contractGuid;

  PaymentDefault({this.type, this.namePaymentProfile, this.contractGuid});

  factory PaymentDefault.fromMap(Map<String, Object> map) {
    return PaymentDefault(
        type: PaymentDefaultType.fromString(map[Key.kind]),
        namePaymentProfile: map[Key.paymentProfile],
        contractGuid: map[Key.contract]);
  }

  @override
  Map<String, Object> toMap() {
    return {
      Key.kind: type.toString(),
      Key.paymentProfile: namePaymentProfile,
      Key.contract: contractGuid
    };
  }
}
