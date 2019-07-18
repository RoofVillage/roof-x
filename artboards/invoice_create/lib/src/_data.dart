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
      FormLabeledValue(
        label: "Rent",
        value: InvoiceType.fromString("contractual"),
      ),
      FormLabeledValue(
        label: "Late fee",
        value: InvoiceType.fromString("lateFee"),
      ),
      FormLabeledValue(
        label: "Security deposit",
        value: InvoiceType.fromString("securityDeposit"),
      ),
      FormLabeledValue(
        label: "Other",
        value: InvoiceType.fromString("other"),
      ),
    ],
  );

  static List<FormLabeledValue> _getPaymentProfiles() {
    // TODO get payment profiels
    return [];
  }
}
