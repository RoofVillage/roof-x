import 'package:string_from_enum_string/index.dart';

enum _DayTypeOption {
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday
}

class DayType {
  final _DayTypeOption _value;
  const DayType._internal(this._value);
  factory DayType.fromString(String string) {
    final option = _DayTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return DayType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
