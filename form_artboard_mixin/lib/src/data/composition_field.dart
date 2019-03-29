import 'package:flutter/material.dart';
import 'package:form/index.dart';

abstract class FormCompositionFieldData
    extends StreamableFormFieldData<String> {
  String placeholder;
  bool autofocus;
  TextInputAction inputAction;
  TextInputType keyboardType;
  bool isOptional;

  List<ValueChanged<String>> _onSubmittedListeners = [];
  ValueChanged<String> get onSubmitted => (value) {
        for (final listener in _onSubmittedListeners) listener(value);
      };

  FormCompositionFieldData({
    this.inputAction,
    @required String title,
    String placeholder,
    TextInputType keyboardType,
    bool isOptional,
    bool autofocus,
    String initialValue,
    double size,
  })  : autofocus = autofocus ?? false,
        placeholder = placeholder ?? "",
        isOptional = isOptional ?? false,
        keyboardType = keyboardType ?? TextInputType.text,
        super(
          title: title,
          initialValue: initialValue ?? "",
          size: size,
        );

  void addOnSubmittedListener(ValueChanged<String> fn) =>
      _onSubmittedListeners.add(fn);
}
