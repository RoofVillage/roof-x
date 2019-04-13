import 'package:string_from_enum_string/index.dart';

enum _BillingStatusTypeOption {
  unverified,
  deactivated,
  suspended,
  retry,
  document,
  verified
}

class BillingStatusType {
  final _BillingStatusTypeOption _value;
  const BillingStatusType._internal(this._value);
  factory BillingStatusType.fromString(String string) {
    final option = _BillingStatusTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return BillingStatusType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
