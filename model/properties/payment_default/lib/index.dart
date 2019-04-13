import 'package:payment_default_type/index.dart';
import 'package:name_payment_profile/index.dart';
import 'package:key/index.dart' as _key;
import 'package:mappable/index.dart';

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
