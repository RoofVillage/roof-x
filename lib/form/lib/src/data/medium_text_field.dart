import 'text_field.dart';

class FormMediumTextFieldData extends FormTextFieldData {
  FormMediumTextFieldData({
    String title,
    String placeholder,
    String initialValue,
    double size,
    bool isVisible,
    bool autofocus,
    String exceptionTitle,
  }) : super(
          title: title,
          placeholder: placeholder,
          initialValue: initialValue,
          autofocus: autofocus,
          size: size,
          isVisible: isVisible,
          max: 50,
          exceptionTitle: exceptionTitle,
        );
}
