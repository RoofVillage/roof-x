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
      slots: 2,
      rowSlots: 3,
      title: "Full name",
      onChanged: (someString) => print(someString));
  final _pooFieldData = FormTextFieldData(
      slots: 1,
      rowSlots: 3,
      title: "Goo name",
      onChanged: (someString) => print(someString));
  final _111FieldData = FormTextFieldData(
      slots: 2,
      rowSlots: 6,
      title: "Goo name",
      onChanged: (someString) => print(someString));
  final _222FieldData = FormTextFieldData(
      slots: 1,
      rowSlots: 6,
      title: "Full name",
      onChanged: (someString) => print(someString));
  final _333FieldData = FormTextFieldData(
      slots: 1,
      rowSlots: 6,
      title: "Goo name",
      onChanged: (someString) => print(someString));
  final _sdfFieldData = FormTextFieldData(
      slots: 2,
      rowSlots: 5,
      title: "Full name",
      onChanged: (someString) => print(someString));
  final _jklFieldData = FormTextFieldData(
      slots: 3,
      rowSlots: 5,
      title: "Goo name",
      onChanged: (someString) => print(someString));

  @override
  Future<StreamableFormData> get initialFormData async {
    final formData = StreamableFormData.withFields(fieldData: [
      _nameFieldData,
      _pooFieldData,
      _sdfFieldData,
      _jklFieldData,
      _111FieldData,
      _222FieldData,
      _333FieldData
    ], fieldHorizontalSpacing: 20);
    return formData;
  }
}
