import 'package:flutter/material.dart';
import 'package:form/index.dart';

abstract class FormCompositionFieldData
    extends StreamableFormFieldData<String> {
  String title;
  String placeholder;
  bool autofocus;
  TextInputAction inputAction;
  ValueChanged<String> onSubmitted;
  TextInputType keyboardType;
  bool isOptional;

  FormCompositionFieldData(
      {this.title,
      this.placeholder,
      this.inputAction,
      this.onSubmitted,
      TextInputType keyboardType,
      bool isOptional,
      bool autofocus,
      String initialValue,
      double size,
      ValueChanged<String> onChanged,
      ValueChanged<bool> onFocusChanged,
      bool isHidden})
      : autofocus = autofocus ?? false,
        isOptional = isOptional ?? false,
        keyboardType = keyboardType ?? TextInputType.text,
        super(
            initialValue: initialValue ?? "",
            onChanged: onChanged,
            onFocusChanged: onFocusChanged,
            size: size,
            isHidden: isHidden);
}
