import 'package:string_from_enum_string/index.dart';

enum _FrequencyTypeOption { daily, weekly, monthly }

class FrequencyType {
  final _FrequencyTypeOption _value;

  String get inlineString {
    switch (_value) {
      case _FrequencyTypeOption.daily:
        return "day";
      case _FrequencyTypeOption.weekly:
        return "week";
      case _FrequencyTypeOption.monthly:
        return "month";
    }
    return null;
  }

  String get whenString {
    switch (_value) {
      case _FrequencyTypeOption.daily:
        return "daily";
      case _FrequencyTypeOption.weekly:
        return "weekly";
      case _FrequencyTypeOption.monthly:
        return "monthly";
    }
    return null;
  }

  const FrequencyType._internal(this._value);
  factory FrequencyType.fromString(String string) {
    final option = _FrequencyTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return FrequencyType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
