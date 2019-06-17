import 'dart:async';

import 'package:form_builder/index.dart';

mixin SettlementCreateArtboardData implements FormBuilder {
  @override
  String get title => "Log a payment";

  @override
  String get submitButtonText => "Log payment";

  @override
  Future<List<StreamableFormFieldData>> get initialFieldData async => [
        _tenant,
        _amount,
        _date,
        _note,
      ];

  final _tenant = FormOptionSelectData<String>(
    title: "Tenant",
    options: _getTenants(),
  );
  final _amount = CurrencyFormTextFieldData(title: "Amount");
  final _date = FormDateFieldData(title: "Payment date");
  final _note = FormTextAreaData(title: "Note (optional)");

  static List<FormOptionSelectValueData<String>> _getTenants() {
    // TODO get tenants
    return [];
  }
}
