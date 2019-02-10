import 'package:types/index.dart';
import '../utils/index.dart';

import '_name_payment_profile.dart';

class PaymentDefault extends Mappable {
  final PaymentDefaultType type;
  final NamePaymentProfile namePaymentProfile;
  final String contractGuid;

  PaymentDefault({this.type, this.namePaymentProfile, this.contractGuid});

  factory PaymentDefault.fromMap(Map<String, Object> map) {
    final type = PaymentDefaultType.values.firstWhere(
        (value) => value.toString() == 'PaymentDefaultType.' + map[Key.kind]);

    return PaymentDefault(
        type: type,
        namePaymentProfile: map[Key.paymentProfile],
        contractGuid: map[Key.contract]);
  }

  @override
  Map<String, Object> toMap() {
    return {
      Key.kind: type.toString().split(".").last,
      Key.paymentProfile: namePaymentProfile,
      Key.contract: contractGuid
    };
  }
}
