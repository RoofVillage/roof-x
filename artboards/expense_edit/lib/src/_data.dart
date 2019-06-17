import 'dart:async';

import 'package:form_builder/index.dart';

mixin ExpenseEditArtboardData implements FormBuilder {
  @override
  String get title => "Add an expense";

  @override
  String get submitButtonText => "Save";

  static String get amount => null;
  static String get note => null;
  static String get paidByGuid => null;
  static List<String> get paidForGuids => null;

  @override
  Future<List<StreamableFormFieldData>> get initialFieldData async => [
        _amount,
        _note,
        _paidBy,
        _for,
      ];

  final _amount = CurrencyFormTextFieldData(
    title: "Amount",
    initialValue: amount,
  );
  final _note = ShortFormTextFieldData(
    title: "Note (optional)",
    initialValue: note,
  );
  final _paidBy = FormOptionSelectData<String>(
    title: "Paid by",
    options: _getRoommates(),
    initialValue: _getRoommates(guids: [paidByGuid]),
  );
  final _for = FormOptionSelectData<String>(
    title: "For",
    options: _getRoommates(),
    initialValue: _getRoommates(guids: paidForGuids),
    isMultiSelect: true,
  );

  static List<FormOptionSelectValueData<String>> _getRoommates(
      {List<String> guids}) {
    return [];
  }
}
