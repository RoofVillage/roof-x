import 'package:types/index.dart';
import '../utils/index.dart';

class Reference extends Mappable {
  final String guid;
  final String domainGuid;
  final DomainType domainType;

  Reference({this.guid, this.domainGuid, this.domainType});

  factory Reference.fromMap(Map<String, Object> map) {
    final domainType = DomainType.values.firstWhere(
        (value) => value.toString() == 'DomainType.' + map[Key.domainKind]);

    return Reference(
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
