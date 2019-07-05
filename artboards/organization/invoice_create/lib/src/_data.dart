import 'dart:async';

import 'package:form_builder/index.dart';
import 'package:invoice_options/index.dart';

mixin InvoiceCreateArtboardData implements FormBuilder {
  @override
  String get title => "Add an invoice";

  @override
  String get submitButtonText => "Create invoice";

  @override
  Future<List<StreamableFormFieldData>> get initialFieldData async => [
        _name,
        _note,
        _amount,
        _dueDate,
        _destination,
        _invoiceType,
      ];

  final _name = ShortFormTextFieldData(title: "Name");
  final _note = FormTextAreaData(title: "Note (optional)");
  final _amount = CurrencyFormTextFieldData(title: "Amount");
  final _dueDate = FormDateFieldData(title: "Due date");
  final _destination = FormOptionSelectFieldData(
    title: "Destination",
    options: _getPaymentProfiles(),
  );
  final _invoiceType = FormOptionSelectFieldData(
    title: "Invoice type",
    options: [
      FormOptionSelectValueData(
        title: "Rent",
        data: InvoiceType.fromString("contractual"),
      ),
      FormOptionSelectValueData(
        title: "Late fee",
        data: InvoiceType.fromString("lateFee"),
      ),
      FormOptionSelectValueData(
        title: "Security deposit",
        data: InvoiceType.fromString("securityDeposit"),
      ),
      FormOptionSelectValueData(
        title: "Other",
        data: InvoiceType.fromString("other"),
      ),
    ],
  );

  static List<FormOptionSelectValueData> _getPaymentProfiles() {
    // TODO get payment profiels
    return [];
  }
}
