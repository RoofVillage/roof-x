import 'package:string_from_enum_string/index.dart';

enum _TransferTypeOption { contractualPayment }

class TransferType {
  final _TransferTypeOption _value;
  const TransferType._internal(this._value);
  factory TransferType.fromString(String string) {
    final option = _TransferTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return TransferType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
