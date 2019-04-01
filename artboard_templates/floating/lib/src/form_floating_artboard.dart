import 'dart:async';

import 'package:flutter/material.dart';
import 'package:button_builder/index.dart';
import 'package:typography/index.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';
import 'package:form_builder/index.dart';
import 'package:artboard/index.dart';
import 'package:date/index.dart';

import 'floating_artboard.dart';
import 'navigator.dart';
import 'mixins/index.dart';

import 'widgets/index.dart';

mixin FormFloatingArtboard<T>
    implements FloatingArtboard<T>, FormBuilder, SubmitButtonBuilder {
  String get title;
  String get subtitle => null;
  String get auxiliaryDescription => null;
  String get auxiliaryButtonText => null;

  @override
  State<StatefulWidget> createState() => _FormFloatingArtboardState();

  @override
  Future<Date> goToDatePicker({BuildContext context, Date selectedDate}) async {
    final dateTime = await ArtboardNavigator.of(context)
        .goTo<Date>(DatePickerFloatingArtboard(selectedDate: selectedDate));

    return Date.fromDateTime(dateTime);
  }
}

class _FormFloatingArtboardState extends State<FormFloatingArtboard>
    with FloatingArtboardState, FormBuilderState {
  @override
  FormBuilder get formBuilder => widget;

  Widget get _submitButton {
    return widget.buildSubmitButton(context,
        text: _submitButtonText,
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

  String get _submitButtonText {
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

  bool _isFocused = false;
  set isFocused(bool isFocused) {
    setState(() {
      _isFocused = isFocused;
    });
  }

  final _headerStyle = RoofTypography.heading1;
  final _subtitleStyle = RoofTypography.bodyPrimary;

  final _bodyVerticalPadding = EdgeInsets.only(top: RoofDistance.d);
  final _buttonVerticalPadding = EdgeInsets.only(top: RoofDistance.d);

  @override
  List<Widget> buildChildren(BuildContext context) {
    final theme = RoofTheme.of(context);

    final headerColor = theme.color.text.brand;
    final subtitleColor = theme.color.text.secondary;
    final headerStyle = _headerStyle.textStyleWithColor(headerColor);
    final subtitleStyle = _subtitleStyle.textStyleWithColor(subtitleColor);

    final submitButton = _submitButton;

    final widgets = <Widget>[];

    if (widget.title != null) {
      widgets.add(Text(widget.title, style: headerStyle));
    }

    if (widget.subtitle != null) {
      widgets.add(Text(widget.subtitle, style: subtitleStyle));
    }

    widgets.add(
      Padding(padding: _bodyVerticalPadding, child: buildForm(context)),
    );

    if (!_isFocused) {
      widgets
          .add(Padding(padding: _buttonVerticalPadding, child: submitButton));
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    widget.form.addOnFocusListener(_onFocus);
    widget.form.addOnResignFocusListener(_onResignFocus);
    return super.build(context);
  }

  @override
  void dispose() {
    disposeOfForm();
    super.dispose();
  }

  void _onFocus() {
    isFocused = true;
    FloatingArtboardNavigator.of(context).hideNavButtons(context);
  }

  void _onResignFocus() {
    isFocused = false;
    FloatingArtboardNavigator.of(context).showNavButtons(context);
  }
}
