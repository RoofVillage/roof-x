import 'dart:async';

import 'package:form_builder/index.dart';

mixin ShoppingItemCreateArtboardData implements FormBuilder {
  @override
  String get title => "Add a shopping item";

  @override
  String get submitButtonText => "Save";

  @override
  Future<List<StreamableFormFieldData>> get initialFieldData async => [
        _name,
        _description,
        _sharedBy,
        _outOfStock,
      ];

  final _name = FormCurrencyTextFieldData(title: "Name");
  final _description = FormTextAreaData(title: "Description (optional)");
  final _sharedBy = FormOptionPickerFieldData<String>(
    title: "Shared by",
    options: _getRoommates(),
  );
  final _outOfStock = FormSwitchFieldData(title: "Currently out of stock");

  static List<FormLabeledValue<String>> _getRoommates() {
    return [];
  }
}
