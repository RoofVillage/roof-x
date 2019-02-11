import 'package:types/index.dart';

import '../utils/index.dart';
import 'billing.dart';

class BankOwnerReference extends Mappable {
  final String guid;
  final String domainGuid;
  final DomainType domainType;
  final BankOwnerType type;
  final Billing billing;

  BankOwnerReference(
      {this.guid, this.domainGuid, this.domainType, this.type, this.billing});

  factory BankOwnerReference.fromMap(Map<String, Object> map) {
    final domainType = DomainType.values.firstWhere(
        (value) => value.toString() == 'DomainType.' + map[Key.domainKind]);
    final type = BankOwnerType.values.firstWhere(
        (value) => value.toString() == 'BankOwnerType.' + map[Key.kind]);
    return BankOwnerReference(
        guid: map[Key.guid],
        domainGuid: map[Key.domainGuid],
        domainType: domainType,
        type: type,
        billing: Billing.fromMap(map[Key.billing]));
  }

  @override
  Map<String, Object> toMap() {
    return {
      Key.domainKind: domainType.toString().split(".").last,
      Key.domainGuid: domainGuid,
      Key.guid: guid,
      Key.billing: billing.toMap()
    };
  }
}
