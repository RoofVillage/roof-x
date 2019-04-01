import 'user_reference.dart';

import '../mixins/index.dart';
import '../key.dart' as _key;

class CompletionCount with Mappable {
  final int value;
  final UserReference user;

  CompletionCount({this.value, this.user});

  factory CompletionCount.fromMap(Map<String, Object> map) {
    return CompletionCount(
        value: map[_key.value], user: UserReference.fromMap(map[_key.user]));
  }

  @override
  Map<String, Object> toMap() {
    return {_key.value: value, _key.user: user.toMap()};
  }
}
