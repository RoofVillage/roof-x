import 'package:types/index.dart';
import '../utils/index.dart';

class Metadata extends Mappable {
  final String key;
  final String value;
  final EventMetaValueType valueType;
  final int priority;

  Metadata({this.key, this.value, this.priority, this.valueType});

  factory Metadata.fromMap(Map<String, Object> map) {
    final priority = map[Key.priority];
    final key = map[Key.key];
    final valueType = EventMetaValueType.fromString(map[Key.valueKind]);

    final value = valueType.decode(map[Key.value]);

    return Metadata(key: key, value: value, priority: priority);
  }

  @override
  Map<String, Object> toMap() {
    return {
      Key.priority: priority,
      Key.key: key,
      Key.value: value,
      Key.valueKind: valueType.toString()
    };
  }
}
