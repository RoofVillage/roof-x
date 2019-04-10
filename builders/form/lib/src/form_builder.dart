import 'package:flutter/material.dart';
import 'package:button_builder/index.dart';
import 'package:form_body_builder/index.dart';
import 'package:typography/index.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';

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

  final _headerStyle = RoofTypography.heading1;
  final _subtitleStyle = RoofTypography.bodyPrimary;

  final _bodyVerticalPadding = EdgeInsets.only(top: RoofDistance.d);
  final _buttonVerticalPadding = EdgeInsets.only(top: RoofDistance.d);

  Widget buildForm(BuildContext context) {
    addFocusChangedListeners();
    final theme = RoofTheme.of(context);

    final headerColor = theme.color.text.brand;
    final subtitleColor = theme.color.text.secondary;
    final headerStyle = _headerStyle.textStyleWithColor(headerColor);
    final subtitleStyle = _subtitleStyle.textStyleWithColor(subtitleColor);

    final widgets = <Widget>[];

    if (widget.title != null) {
      widgets.add(Text(widget.title, style: headerStyle));
    }

    if (widget.subtitle != null) {
      widgets.add(Text(widget.subtitle, style: subtitleStyle));
    }

    widgets.add(
      Padding(padding: _bodyVerticalPadding, child: buildFormBody(context)),
    );

    if (!shouldHideButtons) {
      widgets
          .add(Padding(padding: _buttonVerticalPadding, child: submitButton));
    }

    return Column(children: widgets);
  }
}
