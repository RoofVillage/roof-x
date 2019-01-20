import './text_field_data.dart';

class PasswordFieldData extends TextFieldData {
  final bool isObscured;

  PasswordFieldData({
    this.isObscured,
    minLength,
    maxLength,
    textInputAction,
    name = "Password",
    placeholder = "********",
  }) : super(
            minLength: minLength,
            maxLength: maxLength,
            textInputAction: textInputAction,
            name: name,
            placeholder: placeholder,
            initialValue: initialValue,
            autofocus: autofocus,
            keyboardType: keyboardType);
}
