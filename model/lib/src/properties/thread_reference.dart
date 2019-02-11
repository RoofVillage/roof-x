import '../utils/index.dart';

class ThreadReference extends Mappable {
  final String guid;
  final String name;

  ThreadReference({this.guid, this.name});

  factory ThreadReference.fromMap(Map<String, Object> map) {
    return ThreadReference(guid: map[Key.guid], name: map[Key.name]);
  }

  @override
  Map<String, Object> toMap() {
    return {
      Key.guid: guid,
      Key.name: name,
    };
  }
}
