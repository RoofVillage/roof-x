import 'package:mappable/index.dart';
import 'package:key/index.dart' as _key;

class NameUser with Mappable {
  final String guid;
  final String firstName;
  final String lastName;

  String get preferredName => firstName;

  NameUser({this.guid, this.firstName, this.lastName});

  factory NameUser.fromMap(Map<String, Object> map) {
    final name = map[_key.name] as Map;
    return NameUser(
        guid: map[_key.guid],
        firstName: name[_key.first],
        lastName: name[_key.last]);
  }

  @override
  Map<String, Object> toMap() {
    return {
      _key.guid: guid,
      _key.name: {_key.first: firstName, _key.last: lastName}
    };
  }
}
