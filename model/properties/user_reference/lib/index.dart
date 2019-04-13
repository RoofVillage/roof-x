import 'package:actor_reference/index.dart';

class UserReference extends ActorReference {
  factory UserReference.fromMap(Map<String, Object> map) {
    return ActorReference.fromMap(map);
  }
}
