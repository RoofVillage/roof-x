import 'package:date/index.dart';
import 'package:meta/meta.dart';
import 'package:types/index.dart';
import '../abstract/index.dart';
import '../utils/index.dart';

class Stub extends ModelObject {
  final String name;
  final StubType type;
  final String objectGuid;

  const Stub({
    @required String guid,
    @required Date dateCreated,
    @required String creatorGuid,
    @required this.name,
    @required this.type,
    this.objectGuid,
  })  : assert(name != null),
        assert(type != null),
        super(guid: guid, dateCreated: dateCreated, creatorGuid: creatorGuid);

  factory Stub.fromMap(Map<String, Object> map) {
    assert(map != null);

    final object = ModelObject.fromMap(map);
    final name = map[Key.name];
    final objectGuid = map[Key.object];

    return Stub(
        guid: object.guid,
        dateCreated: object.dateCreated,
        creatorGuid: object.creatorGuid,
        name: name,
        type: StubType.fromString(map[Key.kind]),
        objectGuid: objectGuid);
  }

  @override
  Map<String, Object> toMap() {
    final map = super.toMap();
    map.addAll({
      Key.name: name,
      Key.kind: type.toString(),
      Key.object: objectGuid,
    });

    return map;
  }
}
