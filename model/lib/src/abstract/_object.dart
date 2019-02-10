import '../utils/index.dart';

class ModelObject extends Object with Mappable {
  final String guid;

  @override
  int get hashCode => guid.hashCode;

  @override
  bool operator ==(dynamic other) => other is ModelObject && guid == other.guid;

  const ModelObject({this.guid});

  factory ModelObject.fromMap(Map<String, Object> map) {
    final guid = map[Key.guid];
    return ModelObject(guid: guid);
  }

  Map<String, Object> toMap() {
    return {Key.guid: guid};
  }
}
