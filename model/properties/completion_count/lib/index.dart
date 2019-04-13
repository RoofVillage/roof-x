import 'package:user_reference/index.dart';
import 'package:key/index.dart' as _key;
import 'package:mappable/index.dart';

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
