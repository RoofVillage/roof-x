import 'package:types/index.dart';

import '../utils/index.dart';
import '_reference.dart';

class BankOwner extends Reference {
  final BankOwnerType type;
  // final String billingEmail;
  // final String billingEmailVerified;
  // final String billingFirstName;
  // final String billingLastName;
  // final String billingStatusType;
  // final String billingAddress1;
  // final String billingAddress2;
  // final String billingCity;
  // final String billingPostalCode;

  BankOwner({
    String guid,
    String domainGuid,
    DomainType domainType,
    this.type,
    // this.billingEmail,
    // this.billingEmailVerified,
    // this.billingFirstName,
    // this.billingLastName,
    // this.billingStatusType,
    // this.billingAddress1,
    // this.billingAddress2,
    // this.billingCity,
    // this.billingPostalCode
  }) : super(guid: guid, domainGuid: domainGuid, domainType: domainType);

  factory BankOwner.fromMap(Map<String, Object> map) {
    final superMap = Reference.fromMap(map);
    final type = BankOwnerType.values.firstWhere(
        (value) => value.toString() == 'BankOwnerType.' + map[Key.kind]);
    return BankOwner(
        guid: superMap.guid,
        domainGuid: superMap.domainGuid,
        domainType: superMap.domainType,
        type: type);
  }

  @override
  Map<String, Object> toMap() {
    final map = super.toMap();
    return {
      Key.domainKind: domainType.toString().split(".").last,
      Key.domainGuid: domainGuid,
      Key.guid: guid
    };
  }
}
