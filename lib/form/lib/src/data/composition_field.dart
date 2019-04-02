import 'package:flutter/material.dart';
import 'package:form_validation_exception/index.dart';

import 'field.dart';

abstract class FormCompositionFieldData
    extends StreamableFormFieldData<String> {
  String placeholder;
  bool autofocus;
  TextInputAction inputAction;
  TextInputType keyboardType;
  bool isOptional;
  int max;
  int min;
  String exceptionTitle;

  List<ValueChanged<String>> _onSubmittedListeners = [];
  ValueChanged<String> get onSubmitted => (value) {
        for (final listener in _onSubmittedListeners) listener(value);
      };

  FormCompositionFieldData(
      {this.inputAction,
      this.max,
      this.min,
      @required String title,
      String placeholder,
      TextInputType keyboardType,
      bool isOptional,
      bool autofocus,
      String initialValue,
      double size,
      String exceptionTitle})
      : autofocus = autofocus ?? false,
        placeholder = placeholder ?? "",
        isOptional = isOptional ?? false,
        keyboardType = keyboardType ?? TextInputType.text,
        exceptionTitle = exceptionTitle ?? title,
        super(
          title: title,
          initialValue: initialValue ?? "",
          size: size,
        );

  void addOnSubmittedListener(ValueChanged<String> fn) =>
      _onSubmittedListeners.add(fn);

  @override
  Future<void> validate() async {
    if (max != null && value.length > max) {
      throw FormValidationException.longString(fieldTitle: title, max: max);
    }
    if (min != null && value.length < min) {
      throw FormValidationException.shortString(fieldTitle: title, min: min);
    }
  }
}
