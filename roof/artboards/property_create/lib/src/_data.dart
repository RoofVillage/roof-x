import 'dart:async';

import 'package:form_builder/index.dart';

mixin PropertyCreateArtboardData implements FormBuilder {
  @override
  String get title => "Add a home";

  @override
  String get submitButtonText => "Create home";

  @override
  Future<List<StreamableFormFieldData>> get initialFieldData async => [
        _iconFieldData,
        _address,
        _unit,
        _zip,
        _rentDestination,
      ];

  final _iconFieldData = FormPropertyIconOptionPickerFieldData(
    title: "Property icon",
  );

  final _address = FormShortTextFieldData(
    title: "Property address",
    placeholder: "123 Veranda St.",
  );

  final _unit = FormShortTextFieldData(
    title: "Unit (optional)",
    placeholder: "A",
  );

  final _zip = FormShortTextFieldData(
    title: "ZIP code",
    placeholder: "27510",
  );

  // TODO!!!: make tags field
  // "mask" text field content by spaces/commas into little pill widgets?
  // final _tags =

  static List<FormLabeledValue<String>> _getPaymentProfiles() {
    // TODO
    return [
      FormLabeledValue<String>(
        label: "Payment profile 1",
        value: "asdf",
      ),
      FormLabeledValue<String>(
        label: "Payment profile 2",
        value: "pyio",
      ),
    ];
  }

  final _rentDestination = FormOptionPickerFieldData(
    title: "Default rent destination",
    emptyText: "No payment profiles",
    options: _getPaymentProfiles(),
  );
}
