import 'package:types/index.dart';
import '../utils/index.dart';

import 'name_domain.dart';

class NameContractDomain extends NameDomain {
  final String phoneNumber;
  final bool allowPartialPayments;
  final int invoicePaymentBuffer;

  NameContractDomain(
      {String guid,
      String name,
      ContextType type,
      this.phoneNumber,
      this.allowPartialPayments,
      this.invoicePaymentBuffer})
      : super(guid: guid, name: name, type: type);

  factory NameContractDomain.fromMap(Map<String, Object> map) {
    if (map == null) return null;

    final nameDomain = NameDomain.fromMap(map);
    return NameContractDomain(
        guid: nameDomain.guid,
        name: nameDomain.name,
        type: nameDomain.type,
        phoneNumber: map[Key.phoneNumber],
        allowPartialPayments: map[Key.allowPartialPayments],
        invoicePaymentBuffer: map[Key.invoicePaymentBuffer]);
  }

  @override
  Map<String, Object> toMap() {
    final map = super.toMap();
    map.addAll({
      Key.phoneNumber: phoneNumber,
      Key.allowPartialPayments: allowPartialPayments,
      Key.invoicePaymentBuffer: invoicePaymentBuffer
    });

    return map;
  }
}
