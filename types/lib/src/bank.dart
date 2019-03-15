import 'package:string_from_enum_string/index.dart';

enum _BankTypeOption { checking, savings }

class BankType {
  final _BankTypeOption _value;

  String get title {
    switch (_value) {
      case _BankTypeOption.checking:
        return "Checking";
      case _BankTypeOption.savings:
        return "Savings";
    }
    return null;
  }

  const BankType._internal(this._value);
  factory BankType.fromString(String string) {
    final option = _BankTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return BankType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
