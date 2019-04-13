import 'package:string_from_enum_string/index.dart';

enum _FeePayerTypeOption { payer, receiver }

class FeePayerType {
  final _FeePayerTypeOption _value;
  const FeePayerType._internal(this._value);
  factory FeePayerType.fromString(String string) {
    final option = _FeePayerTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return FeePayerType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
