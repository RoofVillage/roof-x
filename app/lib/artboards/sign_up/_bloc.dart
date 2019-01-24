import 'dart:async';
import 'package:roof_form/index.dart';

class Bloc extends RoofStreamFormBloc {
  FormTextFieldData nameFieldData;

  @override
  Future<StreamableFormData> createFormData() async {
    nameFieldData = FormTextFieldData(
        title: "Full name", onChanged: (someString) => print(someString));
    final formData = StreamableFormData.withFields(fieldData: [nameFieldData]);
    return formData;
  }
}
