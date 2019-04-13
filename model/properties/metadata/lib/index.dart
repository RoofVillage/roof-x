import 'package:event_meta_value_type/index.dart';

import 'package:key/index.dart' as _key;
import 'package:mappable/index.dart';

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
