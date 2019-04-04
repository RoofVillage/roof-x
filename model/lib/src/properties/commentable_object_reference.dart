import 'package:types/index.dart';

import '../mixins/index.dart';
import '../key.dart' as _key;

class CommentableObjectReference with Mappable {
  final String guid;
  final String name;
  final CommentableObjectType type;

  CommentableObjectReference({this.guid, this.name, this.type});

  factory CommentableObjectReference.fromMap(Map<String, Object> map) {
    return CommentableObjectReference(
        guid: map[_key.guid],
        name: map[_key.name],
        type: CommentableObjectType.fromString(map[_key.kind]));
  }

  @override
  Map<String, Object> toMap() {
    return {_key.guid: guid, _key.name: name, _key.kind: type.toString()};
  }
}
