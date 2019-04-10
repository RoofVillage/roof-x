import 'package:flutter/material.dart';
import 'package:button_builder/index.dart';
import 'package:form_body_builder/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:distance/index.dart' as distance;
import 'package:theme/index.dart';
import 'package:button_status_option/index.dart';

mixin FormBuilder implements FormBodyBuilder, PrimaryCenterButtonBuilder {
  String get title;
  String get subtitle => null;
  String get auxiliaryDescription => null;
  String get auxiliaryButtonText => null;
}

mixin FormBuilderState<T extends FormBuilder>
    implements FormBodyBuilderState<T> {
  Widget get submitButton {
    return widget.buildPrimaryCenterButton(
      context,
      text: submitButtonText,
      onTap: onSubmitButtonTap,
      status: _submitButtonState,
    );
  }

  ButtonStatusOption get _submitButtonState {
    switch (formSubmitState) {
      case FormSubmitStatus.exception:
        return ButtonStatusOption.error;
      case FormSubmitStatus.loading:
        return ButtonStatusOption.loading;
      case FormSubmitStatus.ready:
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
      case FormSubmitStatus.ready:
        return widget.submitButtonText ?? "Submit";
    }
    return null;
  }

  final _headerStyle = typography.heading1;
  final _subtitleStyle = typography.bodyPrimary;

  final _bodyVerticalPadding = EdgeInsets.only(top: distance.d);
  final _buttonVerticalPadding = EdgeInsets.only(top: distance.d);

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
