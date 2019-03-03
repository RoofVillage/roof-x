import 'package:meta/meta.dart';
import 'package:types/index.dart';

import '../utils/index.dart';
import 'billing.dart';

import 'actor_reference.dart';

class BankOwnerReference extends ActorReference {
  final BankOwnerType type;
  final Billing billing;

  BankOwnerReference(
      {@required String guid,
      String domainGuid,
      DomainType domainType,
      @required this.type,
      @required this.billing})
      : assert(type != null),
        assert(billing != null),
        super(guid: guid, domainGuid: domainGuid, domainType: domainType);

  factory BankOwnerReference.fromMap(Map<String, Object> map) {
    final actorReference = ActorReference.fromMap(map);

    return BankOwnerReference(
        guid: actorReference.guid,
        domainGuid: actorReference.domainGuid,
        domainType: actorReference.domainType,
        type: BankOwnerType.fromString(map[Key.kind]),
        billing: Billing.fromMap(map[Key.billing]));
  }

  @override
  Map<String, Object> toMap() {
    return {
      Key.domainKind: domainType.toString(),
      Key.domainGuid: domainGuid,
      Key.guid: guid,
      Key.billing: billing.toMap()
    };
  }
}
