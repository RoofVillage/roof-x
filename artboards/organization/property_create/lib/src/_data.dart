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

  final _iconFieldData = FormPropertyIconOptionSelectData(
    title: "Property icon",
  );

  final _address = ShortFormTextFieldData(
    title: "Property address",
    placeholder: "123 Veranda St.",
  );

  final _unit = ShortFormTextFieldData(
    title: "Unit (optional)",
    placeholder: "A",
  );

  final _zip = ShortFormTextFieldData(
    title: "ZIP code",
    placeholder: "27510",
  );

  // TODO!!!: make tags field
  // "mask" text field content by spaces/commas into little pill widgets?
  // final _tags =

  static List<FormOptionSelectValueData<String>> _getPaymentProfiles() {
    // TODO
    return [
      FormOptionSelectValueData<String>(
          title: "Payment profile 1", data: "asdf"),
      FormOptionSelectValueData<String>(
          title: "Payment profile 2", data: "pyio"),
    ];
  }

  final _rentDestination = FormOptionSelectFieldData(
    title: "Default rent destination",
    emptyText: "No payment profiles",
    options: _getPaymentProfiles(),
  );
}
