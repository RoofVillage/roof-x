import 'package:flutter/material.dart';
import 'package:artboard_templates/index.dart';
import 'package:roof_form/index.dart';
import 'package:button_components/index.dart';

class SignUp extends FormFloatingArtboard {
  WidgetBuilder get buildBody => (context) => _SignUpForm();

  @override
  String get title => "Gucci";

  @override
  String get subtitle => "Yamagucci";

  @override
  get button => RoofSubmitButton(buttonText: "Button");
}

class _SignUpForm extends RoofStreamForm {
  final _nameFieldData = FormTextFieldData(
      size: 1 / 2,
      title: "Full name",
      onChanged: (someString) => print(someString));
  final _pooFieldData = FormTextFieldData(
      size: 1 / 2,
      title: "Goo name",
      onChanged: (someString) => print(someString));

  @override
  Future<StreamableFormData> get initialFormData async {
    final formData = SpacedStreamableFormData.withFields(
        fieldData: [_nameFieldData, _pooFieldData]);
    return formData;
  }
}
