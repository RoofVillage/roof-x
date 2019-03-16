import 'package:string_from_enum_string/index.dart';

enum _NotificationEmbeddedObectTypeOption { task }

class NotificationEmbeddedObjectType {
  final _NotificationEmbeddedObectTypeOption _value;
  const NotificationEmbeddedObjectType._internal(this._value);
  factory NotificationEmbeddedObjectType.fromString(String string) {
    final option = _NotificationEmbeddedObectTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return NotificationEmbeddedObjectType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
