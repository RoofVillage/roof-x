import 'package:key/index.dart' as _key;
import 'package:mappable/index.dart';

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
