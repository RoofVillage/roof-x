import 'package:string_from_enum_string/index.dart';

enum _TransferStatusTypeOption {
  processed,
  pending,
  reclaimed,
  manual,
  cancelled,
  failed
}

class TransferStatusType {
  final _TransferStatusTypeOption _value;
  String get tag {
    switch (_value) {
      case _TransferStatusTypeOption.processed:
        return "Processed";
      case _TransferStatusTypeOption.pending:
        return "Pendng";
      case _TransferStatusTypeOption.reclaimed:
        return "Reclaimed";
      case _TransferStatusTypeOption.manual:
        return "Manual";
      case _TransferStatusTypeOption.cancelled:
        return "Cancelled";
      case _TransferStatusTypeOption.failed:
        return "Failed";
    }

    return null;
  }

  String get title {
    switch (_value) {
      case _TransferStatusTypeOption.processed:
        return "Transaction complete";
      case _TransferStatusTypeOption.pending:
        return "Pending. Usually takes 3-5 days.";
      case _TransferStatusTypeOption.reclaimed:
        return "";
      case _TransferStatusTypeOption.manual:
        return "Manual";
      case _TransferStatusTypeOption.cancelled:
        return "Cancelled";
      case _TransferStatusTypeOption.failed:
        return "Failed";
    }

    return null;
  }

  const TransferStatusType._internal(this._value);
  factory TransferStatusType.fromString(String string) {
    final option = _TransferStatusTypeOption.values.firstWhere(
        (value) => stringFromEnumString(value.toString()) == string);

    return TransferStatusType._internal(option);
  }

  String toString() => stringFromEnumString(_value.toString());
}
