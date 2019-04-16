import 'package:string_from_enum_string/index.dart';

enum _PushTokenTypeOption { pushy }

class PushTokenType {
  final _PushTokenTypeOption _value;
  const PushTokenType._internal(this._value);
  factory PushTokenType.fromString(String string) {
    final option = _PushTokenTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return PushTokenType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
