import 'package:string_from_enum_string/index.dart';

enum _PeriodTypeOption { daily, weekly, monthly }

class PeriodType {
  final _PeriodTypeOption _value;

  String get inlineString {
    switch (_value) {
      case _PeriodTypeOption.daily:
        return "day";
      case _PeriodTypeOption.weekly:
        return "week";
      case _PeriodTypeOption.monthly:
        return "month";
    }
    return null;
  }

  String get whenString {
    switch (_value) {
      case _PeriodTypeOption.daily:
        return "daily";
      case _PeriodTypeOption.weekly:
        return "weekly";
      case _PeriodTypeOption.monthly:
        return "monthly";
    }
    return null;
  }

  const PeriodType._internal(this._value);
  factory PeriodType.fromString(String string) {
    final option = _PeriodTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return PeriodType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
