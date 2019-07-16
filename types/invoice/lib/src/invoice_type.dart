import 'package:string_from_enum_string/index.dart';

enum _InvoiceTypeOption { contractual, lateFee, securityDeposit, other }

class InvoiceType {
  final _InvoiceTypeOption _value;

  bool get isFee {
    switch (_value) {
      case _InvoiceTypeOption.lateFee:
        return true;
      default:
        return false;
    }
  }

  String get displayString {
    switch (this.toString()) {
      case "contractual":
        return "Rent";
      case "lateFee":
        return "Late fee";
      case "securityDeposit":
        return "Security Deposit";
      case "other":
        return "Other";
      default:
        return null;
    }
  }

  const InvoiceType._internal(this._value);
  factory InvoiceType.fromString(String string) {
    final option = _InvoiceTypeOption.values.firstWhere(
      (value) => stringFromEnumString(value.toString()) == string,
      orElse: () => throw ("Error evaluating InvoiceType: $string"),
    );

    return InvoiceType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
