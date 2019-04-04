import '../mixins/index.dart';
import '../key.dart' as _key;

class NameProperty with Mappable {
  final String name;

  NameProperty({this.name});

  factory NameProperty.fromMap(Map<String, Object> map) {
    if (map == null) return null;
    return NameProperty(name: map[_key.name]);
  }

  @override
  Map<String, Object> toMap() {
    return {_key.name: name};
  }
}
