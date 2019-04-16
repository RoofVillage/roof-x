import 'package:key/index.dart' as _key;
import 'package:mappable/index.dart';

class ThreadReference with Mappable {
  final String guid;
  final String name;

  ThreadReference({this.guid, this.name});

  factory ThreadReference.fromMap(Map<String, Object> map) {
    return ThreadReference(guid: map[_key.guid], name: map[_key.name]);
  }

  @override
  Map<String, Object> toMap() {
    return {
      _key.guid: guid,
      _key.name: name,
    };
  }
}
