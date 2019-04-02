import 'text_field.dart';

class MediumFormTextFieldData extends FormTextFieldData {
  MediumFormTextFieldData({
    String title,
    String placeholder,
    String initialValue,
    double size,
    bool autofocus,
    String exceptionTitle,
  }) : super(
          title: title,
          placeholder: placeholder,
          initialValue: initialValue,
          autofocus: autofocus,
          size: size,
          max: 50,
          exceptionTitle: exceptionTitle,
        );
}
