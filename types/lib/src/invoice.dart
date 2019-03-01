import 'utils/index.dart';

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

  const InvoiceType._internal(this._value);
  factory InvoiceType.fromString(String string) {
    final option = _InvoiceTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return InvoiceType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
