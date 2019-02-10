import 'package:types/index.dart';
import '../utils/index.dart';

class NameContext with Mappable {
  final String guid;
  final String name;
  final ContextType type;

  NameContext({this.guid, this.name, this.type});

  factory NameContext.fromMap(Map<String, Object> map) {
    return NameContext(
        guid: map[Key.guid], name: map[Key.name], type: map[Key.kind]);
  }

  @override
  Map<String, Object> toMap() {
    return {Key.guid: guid, Key.name: name, Key.kind: type};
  }
}
