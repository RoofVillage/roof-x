import 'package:string_from_enum_string/index.dart';

enum _BankOwnerTypeOption { user, org, stub }

class BankOwnerType {
  final _BankOwnerTypeOption _value;
  const BankOwnerType._internal(this._value);
  factory BankOwnerType.fromString(String string) {
    final option = _BankOwnerTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return BankOwnerType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
