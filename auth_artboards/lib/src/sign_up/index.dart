import 'package:artboard_templates/index.dart';
import 'package:roof_form/index.dart';

class SignUpArtboard extends FormFloatingArtboard {
  @override
  String get title => "Gucci";

  @override
  String get subtitle => "Yamagucci";

  @override
  String get submitButtonText => "Next";

  List<StreamableFormFieldData> get fieldData {
    final _nameFieldData = FormTextFieldData(
        size: 1 / 2,
        title: "Full name",
        placeholder: "placeholder",
        onChanged: (someString) => print(someString));

    final _goodFieldData = FormTextFieldData(
        size: 1 / 2,
        title: "Good name",
        placeholder: "placeholder",
        onChanged: (someString) => print(someString));

    return [_nameFieldData, _goodFieldData];
  }

  @override
  String get address => "signup";

  @override
  Map<String, dynamic> get params => {};
}
