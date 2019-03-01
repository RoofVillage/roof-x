import '../utils/index.dart';

class NameUser with Mappable {
  final String guid;
  final String firstName;
  final String lastName;

  String get preferredName => firstName;

  NameUser({this.guid, this.firstName, this.lastName});

  factory NameUser.fromMap(Map<String, Object> map) {
    final name = map[Key.name] as Map;
    return NameUser(
        guid: map[Key.guid],
        firstName: name[Key.first],
        lastName: name[Key.last]);
  }

  @override
  Map<String, Object> toMap() {
    return {
      Key.guid: guid,
      Key.name: {Key.first: firstName, Key.last: lastName}
    };
  }
}
