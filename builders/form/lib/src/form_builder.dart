import 'package:flutter/material.dart';
import 'package:button_builder/index.dart';
import 'package:form_body_builder/index.dart';

mixin FormBuilder implements FormBodyBuilder, SubmitButtonBuilder {
  String get title;
  String get subtitle => null;
  String get auxiliaryDescription => null;
  String get auxiliaryButtonText => null;
}

mixin FormBuilderState<T extends FormBuilder>
    implements FormBodyBuilderState<T> {
  Widget get submitButton {
    return widget.buildSubmitButton(context,
        text: submitButtonText,
        onTap: onSubmitButtonTap,
        state: _submitButtonState);
  }

  SubmitButtonStateOption get _submitButtonState {
    switch (formSubmitState) {
      case FormSubmitState.exception:
        return SubmitButtonStateOption.error;
      case FormSubmitState.loading:
        return SubmitButtonStateOption.loading;
      case FormSubmitState.normal:
        return SubmitButtonStateOption.ready;
    }
    return null;
  }

  String get submitButtonText {
    switch (formSubmitState) {
      case FormSubmitState.exception:
        return exception.message;
      case FormSubmitState.loading:
        return "Loading";
      case FormSubmitState.normal:
        return widget.submitButtonText ?? "Submit";
    }
    return null;
  }
}
