import 'package:types/index.dart';
import '../utils/index.dart';

class CommentableObjectReference extends Mappable {
  final String guid;
  final String name;
  final CommentableObjectType type;

  CommentableObjectReference({this.guid, this.name, this.type});

  factory CommentableObjectReference.fromMap(Map<String, Object> map) {
    return CommentableObjectReference(
        guid: map[Key.guid],
        name: map[Key.name],
        type: CommentableObjectType.fromString(map[Key.kind]));
  }

  @override
  Map<String, Object> toMap() {
    return {Key.guid: guid, Key.name: name, Key.kind: type.toString()};
  }
}
