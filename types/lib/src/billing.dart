import 'package:string_from_enum_string/index.dart';

enum _BillingTypeOption { unverified, personal, business, receiveOnly }

class BillingType {
  final _BillingTypeOption _value;
  const BillingType._internal(this._value);
  factory BillingType.fromString(String string) {
    final option = _BillingTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return BillingType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
