import 'package:meta/meta.dart';
import 'package:types/index.dart';
import '../utils/index.dart';

class ActorReference extends Mappable {
  final String guid;
  final String domainGuid;
  final DomainType domainType;

  ActorReference({@required this.guid, this.domainGuid, this.domainType})
      : assert(guid == null);

  factory ActorReference.fromMap(Map<String, Object> map) {
    if (map == null) return null;

    return ActorReference(
        guid: map[Key.guid],
        domainGuid: map[Key.domainGuid],
        domainType: DomainType.fromString(map[Key.domainKind]));
  }

  @override
  Map<String, Object> toMap() {
    return {
      Key.domainKind: domainType.toString(),
      Key.domainGuid: domainGuid,
      Key.guid: guid
    };
  }
}
