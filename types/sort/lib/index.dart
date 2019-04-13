import 'package:string_from_enum_string/index.dart';

enum _SortTypeOption { asc, desc }

class SortType {
  final _SortTypeOption _value;
  const SortType._internal(this._value);
  factory SortType.fromString(String string) {
    final option = _SortTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return SortType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
