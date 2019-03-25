import 'package:flutter/material.dart';
import 'package:form/index.dart';

abstract class FormCompositionFieldData
    extends StreamableFormFieldData<String> {
  String title;
  String placeholder;
  bool autofocus;
  TextInputAction inputAction;
  bool canSubmitWithKeyboardRaised;
  ValueChanged<String> onSubmitted;
  bool isOptional;

  FormCompositionFieldData(
      {this.title,
      this.placeholder,
      this.inputAction,
      this.onSubmitted,
      bool isOptional,
      bool autofocus,
      bool canSubmitWithKeyboardRaised,
      String initialValue,
      double size,
      ValueChanged<String> onChanged,
      ValueChanged<bool> onFocusChanged,
      bool hidden})
      : autofocus = autofocus ?? false,
        isOptional = isOptional ?? false,
        canSubmitWithKeyboardRaised = canSubmitWithKeyboardRaised ?? true,
        super(
            initialValue: initialValue ?? "",
            onChanged: onChanged,
            onFocusChanged: onFocusChanged,
            size: size,
            hidden: hidden);
}
