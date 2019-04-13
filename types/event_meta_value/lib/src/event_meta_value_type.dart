import 'package:date/index.dart';
import 'package:string_from_enum_string/index.dart';

enum _EventMetaValueTypeOption { string, amount, users, number, timestamp }

class EventMetaValueType {
  final _EventMetaValueTypeOption _value;
  const EventMetaValueType._internal(this._value);
  factory EventMetaValueType.fromString(String string) {
    final option = _EventMetaValueTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return EventMetaValueType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());

  String decode(dynamic value) {
    switch (_value) {
      case _EventMetaValueTypeOption.timestamp:
        return Date.fromSecondsSinceEpoch(value).toAbbreviatedString;

      case _EventMetaValueTypeOption.string:
        return value;
      case _EventMetaValueTypeOption.amount:
        return value;
      case _EventMetaValueTypeOption.users:
        return value;
      case _EventMetaValueTypeOption.number:
        return value;
    }

    return null;
  }
}
