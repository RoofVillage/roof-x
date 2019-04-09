import 'package:flutter/material.dart';
import 'package:button_builder/index.dart';
import 'package:form_body_builder/index.dart';

mixin FormBuilder implements FormBodyBuilder, CenteredButtonBuilder {
  String get title;
  String get subtitle => null;
  String get auxiliaryDescription => null;
  String get auxiliaryButtonText => null;
}

mixin FormBuilderState<T extends FormBuilder>
    implements FormBodyBuilderState<T> {
  Widget get submitButton {
    return widget.buildPrimaryCenteredButton(context,
        text: submitButtonText,
        onTap: onSubmitButtonTap,
        status: _submitButtonState);
  }

  ButtonStatusOption get _submitButtonState {
    switch (formSubmitState) {
      case FormSubmitStatus.exception:
        return ButtonStatusOption.error;
      case FormSubmitStatus.loading:
        return ButtonStatusOption.loading;
      case FormSubmitStatus.normal:
        return ButtonStatusOption.ready;
    }
    return null;
  }

  String get submitButtonText {
    switch (formSubmitState) {
      case FormSubmitStatus.exception:
        return exception.message;
      case FormSubmitStatus.loading:
        return "Loading";
      case FormSubmitStatus.normal:
        return widget.submitButtonText ?? "Submit";
    }
    return null;
  }
}
