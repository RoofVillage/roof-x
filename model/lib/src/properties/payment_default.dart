import 'package:types/index.dart';

import 'name_payment_profile.dart';
import '../mixins/index.dart';
import '../key.dart' as _key;

class PaymentDefault with Mappable {
  final PaymentDefaultType type;
  final NamePaymentProfile namePaymentProfile;
  final String contractGuid;

  PaymentDefault({this.type, this.namePaymentProfile, this.contractGuid});

  factory PaymentDefault.fromMap(Map<String, Object> map) {
    return PaymentDefault(
        type: PaymentDefaultType.fromString(map[_key.kind]),
        namePaymentProfile: map[_key.paymentProfile],
        contractGuid: map[_key.contract]);
  }

  @override
  Map<String, Object> toMap() {
    return {
      _key.kind: type.toString(),
      _key.paymentProfile: namePaymentProfile,
      _key.contract: contractGuid
    };
  }
}
