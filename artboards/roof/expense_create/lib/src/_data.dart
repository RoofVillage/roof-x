import 'dart:async';

import 'package:form_builder/index.dart';

mixin ExpenseCreateArtboardData implements FormBuilder {
  @override
  String get title => "Add an expense";

  @override
  String get submitButtonText => "Save";

  @override
  Future<List<StreamableFormFieldData>> get initialFieldData async => [
        _amount,
        _note,
        _paidBy,
        _for,
      ];

  final _amount = CurrencyFormTextFieldData(title: "Amount");
  final _note = ShortFormTextFieldData(title: "Note (optional)");
  final _paidBy = FormOptionPickerFieldData<String>(
    title: "Paid by",
    options: _getRoommates(),
  );
  final _for = FormOptionPickerFieldData<String>(
    title: "For",
    options: _getRoommates(),
    isMultiSelect: true,
  );

  static List<FormTitledOptionData<String>> _getRoommates() {
    return [];
  }
}
