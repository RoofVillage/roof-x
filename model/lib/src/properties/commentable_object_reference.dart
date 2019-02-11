import 'package:types/index.dart';
import '../utils/index.dart';

class CommentableObjectReference extends Mappable {
  final String guid;
  final String name;
  final CommentableObjectType type;

  CommentableObjectReference({this.guid, this.name, this.type});

  factory CommentableObjectReference.fromMap(Map<String, Object> map) {
    final commentableObjectType = CommentableObjectType.values.firstWhere(
        (value) =>
            value.toString() == 'CommentableObjectType.' + map[Key.kind]);

    return CommentableObjectReference(
        guid: map[Key.guid], name: map[Key.name], type: commentableObjectType);
  }

  @override
  Map<String, Object> toMap() {
    return {
      Key.guid: guid,
      Key.name: name,
      Key.kind: type.toString().split(".").last
    };
  }
}
