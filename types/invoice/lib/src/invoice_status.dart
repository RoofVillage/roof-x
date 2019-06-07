import 'package:string_from_enum_string/index.dart';

enum InvoiceStatusOption { paid, unpaid, overdue }

class InvoiceStatus {
  static InvoiceStatusOption fromInvoice(int unpaidAmount, int dueTimestamp) {
    if (unpaidAmount == 0) {
      return InvoiceStatusOption.paid;
    } else if (dueTimestamp < DateTime.now().millisecondsSinceEpoch / 1000) {
      return InvoiceStatusOption.overdue;
    } else {
      return InvoiceStatusOption.unpaid;
    }
  }
}
