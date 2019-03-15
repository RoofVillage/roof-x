import 'package:floating_artboard_templates/index.dart';
import 'package:form_artboard_mixin/index.dart';
import 'package:app_data/index.dart';

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
        onChanged: (someString) => print("Textfield: $someString"));

    final _goodFieldData = FormTextFieldData(
        size: 1 / 2,
        title: "Good name",
        onChanged: (someString) => print("Textfield2: $someString"));

    final _textArea = FormTextAreaData(
        title: "Text area",
        onChanged: (someString) => print("textarea: $someString"));

    final _switch1 = FormSwitchData(
        title: "Turn dis on",
        initialValue: false,
        onChanged: (isOn) => print("switch $isOn"));
    final _switch2 = FormSwitchData(
        title: "Turn dis off",
        initialValue: true,
        onChanged: (isOn) => print("switch $isOn"));
    final _selectField = FormOptionSelectData(
        title: "Pick yo shit",
        options: [
          FormOptionSelectValueData(title: "One"),
          FormOptionSelectValueData(title: "two"),
        ],
        onChanged: (selectedOptions) {
          print("Select field: ${selectedOptions[0].title}");
        });

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
  get submit => User()
      .create(name: "Tony hawk", email: "tony@hawk.io", password: "T0nYRocks");
}
