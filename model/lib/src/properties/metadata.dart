import 'package:types/index.dart';

import '../mixins/index.dart';
import '../key.dart' as _key;

class Metadata with Mappable {
  final String key;
  final String value;
  final EventMetaValueType valueType;
  final int priority;

  Metadata({this.key, this.value, this.priority, this.valueType});

  factory Metadata.fromMap(Map<String, Object> map) {
    final priority = map[_key.priority];
    final key = map[_key.key];
    final valueType = EventMetaValueType.fromString(map[_key.valueKind]);

    final value = valueType.decode(map[_key.value]);

    return Metadata(key: key, value: value, priority: priority);
  }

  @override
  Map<String, Object> toMap() {
    return {
      _key.priority: priority,
      _key.key: key,
      _key.value: value,
      _key.valueKind: valueType.toString()
    };
  }
}
