import 'package:types/index.dart';
import '../utils/index.dart';

class UserReference extends Mappable {
  final String guid;
  final String domainGuid;
  final DomainType domainType;

  UserReference({this.guid, this.domainGuid, this.domainType});

  factory UserReference.fromMap(Map<String, Object> map) {
    final domainType = DomainType.values.firstWhere(
        (value) => value.toString() == 'DomainType.' + map[Key.domainKind]);

    return UserReference(
        guid: map[Key.guid],
        domainGuid: map[Key.domainGuid],
        domainType: domainType);
  }

  @override
  Map<String, Object> toMap() {
    return {
      Key.domainKind: domainType.toString().split(".").last,
      Key.domainGuid: domainGuid,
      Key.guid: guid
    };
  }
}
