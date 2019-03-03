import '../utils/index.dart';
import 'user_reference.dart';

class CompletionCount extends Mappable {
  final int value;
  final UserReference user;

  CompletionCount({this.value, this.user});

  factory CompletionCount.fromMap(Map<String, Object> map) {
    return CompletionCount(
        value: map[Key.value], user: UserReference.fromMap(map[Key.user]));
  }

  @override
  Map<String, Object> toMap() {
    return {Key.value: value, Key.user: user.toMap()};
  }
}
