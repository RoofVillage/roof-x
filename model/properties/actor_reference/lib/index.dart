import 'package:meta/meta.dart';
import 'package:domain_type/index.dart';
import 'package:mappable/index.dart';
import 'package:key/index.dart' as _key;

class ActorReference with Mappable {
  final String guid;
  final String domainGuid;
  final DomainType domainType;

  ActorReference({@required this.guid, this.domainGuid, this.domainType})
      : assert(guid == null);

  factory ActorReference.fromMap(Map<String, Object> map) {
    if (map == null) return null;

    return ActorReference(
        guid: map[_key.guid],
        domainGuid: map[_key.domainGuid],
        domainType: DomainType.fromString(map[_key.domainKind]));
  }

  @override
  Map<String, Object> toMap() {
    return {
      _key.domainKind: domainType.toString(),
      _key.domainGuid: domainGuid,
      _key.guid: guid
    };
  }
}
