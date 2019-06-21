import 'text_field.dart';

class ShortFormTextFieldData extends FormTextFieldData {
  ShortFormTextFieldData({
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
          max: 40,
          exceptionTitle: exceptionTitle,
        );
}
