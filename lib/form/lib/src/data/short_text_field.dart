import 'text_field.dart';

class FormShortTextFieldData extends FormTextFieldData {
  static const _shortTextFieldMaxLength = 40;

  FormShortTextFieldData({
    String title,
    String placeholder,
    String initialValue,
    double size,
    bool isVisible,
    bool autofocus,
    bool isRequired,
    bool isRemovable,
    String exceptionTitle,
  }) : super(
          title: title,
          placeholder: placeholder,
          initialValue: initialValue,
          autofocus: autofocus,
          size: size,
          isVisible: isVisible,
          max: _shortTextFieldMaxLength,
          min: isRequired == true ? 1 : null,
          isRemovable: isRemovable,
          exceptionTitle: exceptionTitle,
        );
}
