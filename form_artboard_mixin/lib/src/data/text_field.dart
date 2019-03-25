import 'package:flutter/material.dart';
import 'package:mask/index.dart';
import 'composition_field.dart';

abstract class FormTextFieldData extends FormCompositionFieldData {
  MaskOption mask;

  FormTextFieldData(
      {this.mask,
      String title,
      String placeholder,
      String initialValue,
      double size,
      bool autofocus,
      bool canSubmitWithKeyboardRaised,
      ValueChanged<String> onSubmitted,
      ValueChanged<String> onChanged,
      ValueChanged<bool> onFocusChanged,
      bool isOptional,
      bool hidden})
      : super(
            title: title,
            placeholder: placeholder,
            initialValue: initialValue,
            onSubmitted: onSubmitted,
            onChanged: onChanged,
            onFocusChanged: onFocusChanged,
            autofocus: autofocus,
            canSubmitWithKeyboardRaised: canSubmitWithKeyboardRaised,
            size: size,
            isOptional: isOptional,
            hidden: hidden);
}
