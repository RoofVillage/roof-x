import 'package:types/index.dart';
import '../abstract/index.dart';
import '../utils/index.dart';

class Stub extends ModelObject {
  final String name;
  final StubType type;
  final String objectGuid;

  const Stub({
    String guid,
    this.name,
    this.type,
    this.objectGuid,
  }) : super(guid: guid);

  factory Stub.fromMap(Map<String, Object> map) {
    final object = ModelObject.fromMap(map);
    final name = map[Key.name];
    final type = StubType.values
        .firstWhere((value) => value.toString() == 'StubType.' + map[Key.kind]);
    final objectGuid = map[Key.object];

    return Stub(
        guid: object.guid, name: name, type: type, objectGuid: objectGuid);
  }

  @override
  Map<String, Object> toMap() {
    final map = super.toMap();
    map.addAll({
      Key.name: name,
      Key.kind: type.toString().split(".").last,
      Key.object: objectGuid,
    });

    return map;
  }
}
