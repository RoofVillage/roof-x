import './text_field_data.dart';

class EmailFieldData extends FieldData {
  EmailFieldData({minLength, maxLength, textInputAction})
      : super(
          minLength: minLength,
          maxLength: maxLength,
          textInputAction: textInputAction,
        );

  PasswordFieldData({minLength, maxLength, textInputAction})
      : super(
          minLength: minLength,
          maxLength: maxLength,
          textInputAction: textInputAction,
        );
}
