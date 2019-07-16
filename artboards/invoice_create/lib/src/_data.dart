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

  final _name = FormShortTextFieldData(title: "Name");
  final _note = FormTextAreaData(title: "Note (optional)");
  final _amount = FormCurrencyTextFieldData(title: "Amount");
  final _dueDate = FormDatePickerFieldData(title: "Due date");
  final _destination = FormOptionPickerFieldData(
    title: "Destination",
    options: _getPaymentProfiles(),
  );
  final _invoiceType = FormOptionPickerFieldData(
    title: "Invoice type",
    options: [
      FormTitledValue(
        title: "Rent",
        value: InvoiceType.fromString("contractual"),
      ),
      FormTitledValue(
        title: "Late fee",
        value: InvoiceType.fromString("lateFee"),
      ),
      FormTitledValue(
        title: "Security deposit",
        value: InvoiceType.fromString("securityDeposit"),
      ),
      FormTitledValue(
        title: "Other",
        value: InvoiceType.fromString("other"),
      ),
    ],
  );

  static List<FormTitledValue> _getPaymentProfiles() {
    // TODO get payment profiels
    return [];
  }
}
