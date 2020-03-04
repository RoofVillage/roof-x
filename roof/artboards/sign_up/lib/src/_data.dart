import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_builder/index.dart';

mixin SignUpArtboardData implements FormBuilder {
  @override
  String get title => "Create an account";

  @override
  String get submitButtonText => "Create";

  @override
  Future<List<StreamableFormFieldData>> get initialFieldData async => [
        _temp2,
        _temp3,
        _nameFieldData,
        _emailFieldData,
        _passwordFieldData,
      ];

  final _nameFieldData = FormMediumTextFieldData(
    title: "Full name",
    placeholder: "ty hay",
  );
  final _emailFieldData = FormEmailTextFieldData(
    placeholder: "tyhay@email.com",
  );
  final _passwordFieldData = FormPasswordTextFieldData();
  final _temp = FormCurrencyTextFieldData();
  final _temp2 = FormSwitchFieldData(title: "Toggle field");
  final _temp3 = FormDatePickerFieldData(title: "Sup");

  @override
  void setupFields(BuildContext context,
      {List<StreamableFormFieldData> fieldData}) {
    _temp2.addOnChangedListener(_toggleField);
  }

  void _toggleField(bool showing) {
    if (showing) {
      form.insertFieldDataAfter(_temp, _temp2);
    } else {
      form.removeFieldData(_temp);
    }
  }
}
