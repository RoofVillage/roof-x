import '../utils/index.dart';

class NameProperty extends Mappable {
  final String name;

  NameProperty({this.name});

  factory NameProperty.fromMap(Map<String, Object> map) {
    return NameProperty(name: map[Key.name]);
  }

  @override
  Map<String, Object> toMap() {
    return {Key.name: name};
  }
}
