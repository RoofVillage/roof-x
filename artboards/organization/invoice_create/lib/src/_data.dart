import 'dart:async';

import 'package:form_builder/index.dart';
import 'package:ordinal_suffix_string_from_int/index.dart';
import 'package:interval/index.dart';
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
  final _destination = FormOptionSelectFieldData<String>(
    title: "Destination",
    options: _getPaymentProfiles(),
  );
  final _invoiceType = FormOptionSelectFieldData<InvoiceType>(
    title: "Invoice type",
    options: [
      FormOptionSelectValueData<InvoiceType>(
        title: "Rent",
        data: InvoiceType.fromString("contractual"),
      ),
      FormOptionSelectValueData<InvoiceType>(
        title: "Late fee",
        data: InvoiceType.fromString("lateFee"),
      ),
      FormOptionSelectValueData<InvoiceType>(
        title: "Security deposit",
        data: InvoiceType.fromString("securityDeposit"),
      ),
      FormOptionSelectValueData<InvoiceType>(
        title: "Other",
        data: InvoiceType.fromString("other"),
      ),
    ],
  );

  static List<FormOptionSelectValueData<String>> _getPaymentProfiles() {
    // TODO get payment profiels
    return [];
  }
}
