import 'package:flutter/material.dart';
import 'package:artboard_templates/index.dart';
import 'package:roof_form/index.dart';

class SignUp extends FormFloatingArtboard {
  WidgetBuilder get buildBody => (context) => _SignUpForm();

  @override
  String get title => "Gucci";

  @override
  String get subtitle => "Yamagucci";
}

class _SignUpForm extends RoofStreamForm {
  final _nameFieldData = FormTextFieldData(
      slots: 1,
      rowSlots: 2,
      title: "Full name",
      onChanged: (someString) => print(someString));
  final _pooFieldData = FormTextFieldData(
      slots: 1,
      rowSlots: 2,
      title: "Goo name",
      onChanged: (someString) => print(someString));

  @override
  Future<StreamableFormData> get initialFormData async {
    final formData = StreamableFormData.withFields(
        fieldData: [_nameFieldData, _pooFieldData]);
    return formData;
  }
}
