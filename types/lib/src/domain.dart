import 'package:string_from_enum_string/index.dart';

enum _DomainTypeOption { roof, org }

class DomainType {
  final _DomainTypeOption _value;
  const DomainType._internal(this._value);
  factory DomainType.fromString(String string) {
    final option = _DomainTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return DomainType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
