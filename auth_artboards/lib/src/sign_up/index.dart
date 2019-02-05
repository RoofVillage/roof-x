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

    final _textArea = FormTextAreaData(title: "Text area");

    final _switch1 = FormSwitchData(title: "Turn dis on", initialValue: false);
    final _switch2 = FormSwitchData(title: "Turn dis off", initialValue: true);
    final _selectField = FormOptionSelectData(title: "Pick yo shit", options: [
      FormOptionSelectValueData(title: "One"),
      FormOptionSelectValueData(title: "two")
    ]);

    return [
      _nameFieldData,
      _goodFieldData,
      _textArea,
      _switch1,
      _switch2,
      _selectField
    ];
  }

  @override
  String get address => "signup";

  @override
  Map<String, dynamic> get params => {};
}
