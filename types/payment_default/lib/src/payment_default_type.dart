import 'package:string_from_enum_string/index.dart';

enum _PaymentDefaultTypeOption { contractualPayment }

class PaymentDefaultType {
  final _PaymentDefaultTypeOption _value;
  const PaymentDefaultType._internal(this._value);
  factory PaymentDefaultType.fromString(String string) {
    final option = _PaymentDefaultTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return PaymentDefaultType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
