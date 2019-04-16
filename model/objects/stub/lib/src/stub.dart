import 'package:date/index.dart';
import 'package:meta/meta.dart';
import 'package:stub_type/index.dart';
import 'package:model_object/index.dart';
import 'package:key/index.dart' as _key;

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
    final name = map[_key.name];
    final objectGuid = map[_key.object];

    return Stub(
        guid: object.guid,
        dateCreated: object.dateCreated,
        creatorGuid: object.creatorGuid,
        name: name,
        type: StubType.fromString(map[_key.kind]),
        objectGuid: objectGuid);
  }

  @override
  Map<String, Object> toMap() {
    final map = super.toMap();
    map.addAll({
      _key.name: name,
      _key.kind: type.toString(),
      _key.object: objectGuid,
    });

    return map;
  }
}
