import 'package:string_from_enum_string/index.dart';

enum _BankStatusTypeOption { verified, unverified }

class BankStatusType {
  final _BankStatusTypeOption _value;
  const BankStatusType._internal(this._value);
  factory BankStatusType.fromString(String string) {
    final option = _BankStatusTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return BankStatusType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
