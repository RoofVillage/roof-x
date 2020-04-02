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
  double maxValue;
  int max;
  int min;
  String exceptionTitle;

  List<ValueChanged<String>> _onSubmittedListeners = [];
  ValueChanged<String> get onSubmitted => (value) {
        for (final listener in _onSubmittedListeners) listener(value);
      };

  FormCompositionFieldData({
    this.inputAction,
    this.maxValue,
    this.max,
    this.min,
    @required String title,
    String placeholder,
    TextInputType keyboardType,
    bool isOptional,
    bool autofocus,
    String initialValue,
    double size,
    bool isVisible,
    bool isRemovable,
    String exceptionTitle,
  })  : autofocus = autofocus ?? false,
        placeholder = placeholder ?? "",
        isOptional = isOptional ?? false,
        keyboardType = keyboardType ?? TextInputType.text,
        exceptionTitle = exceptionTitle ?? title,
        super(
          title: title,
          initialValue: initialValue ?? "",
          size: size,
          isRemovable: isRemovable,
          isVisible: isVisible,
        );

  void addOnSubmittedListener(ValueChanged<String> fn) =>
      _onSubmittedListeners.add(fn);

  @override
  Future<void> validate() async {
    if (max != null && value.length > max) {
      throw FormValidationException.tooLongString(fieldTitle: title, max: max);
    }
    if (min != null && value.length < min) {
      throw FormValidationException.tooShortString(fieldTitle: title, min: min);
    }
    if (maxValue != null && double.parse(value) > maxValue) {
      throw FormValidationException.maxValue(
          fieldTitle: title, maxValue: maxValue);
    }
  }
}
