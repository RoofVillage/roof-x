import 'package:meta/meta.dart';
import 'package:bank_owner_type/index.dart';
import 'package:domain_type/index.dart';
import 'package:key/index.dart' as _key;
import 'package:billing/index.dart';
import 'package:actor_reference/index.dart';

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
        type: BankOwnerType.fromString(map[_key.kind]),
        billing: Billing.fromMap(map[_key.billing]));
  }

  @override
  Map<String, Object> toMap() {
    return {
      _key.domainKind: domainType.toString(),
      _key.domainGuid: domainGuid,
      _key.guid: guid,
      _key.billing: billing.toMap()
    };
  }
}
