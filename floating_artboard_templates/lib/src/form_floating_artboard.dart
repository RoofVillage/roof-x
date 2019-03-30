import 'dart:async';

import 'package:flutter/material.dart';
import 'package:button_components/index.dart';
import 'package:typography/index.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';
import 'package:form_artboard_mixin/index.dart';
import 'package:artboard/index.dart';

import 'floating_artboard.dart';
import 'navigator.dart';
import 'mixins/index.dart';

abstract class FormFloatingArtboard<T> extends FloatingArtboard<T>
    with FormArtboard {
  String get title;
  String get subtitle => null;
  String get auxiliaryDescription => null;
  String get auxiliaryButtonText => null;

  @override
  State<StatefulWidget> createState() => _FormFloatingArtboardState();

  @override
  Future<DateTime> goToDatePicker(BuildContext context) {
    return Future.value(DateTime.now());
    // FloatingArtboardNavigator.of(context).goTo(artboard);
  }
}

class _FormFloatingArtboardState extends State<FormFloatingArtboard>
    with FloatingArtboardState, FormArtboardState {
  @override
  FormArtboard get formArtboard => widget;

  Widget get _submitButton {
    switch (formSubmitState) {
      case FormSubmitState.exception:
        return RoofSubmitButton(
          text: exception.message,
          onTap: onSubmitButtonTap,
        );
      case FormSubmitState.loading:
        return RoofSubmitButton(
          text: "Loading",
          onTap: onSubmitButtonTap,
          buttonState: ButtonState.inactive,
        );
      case FormSubmitState.normal:
        return RoofSubmitButton(
          text: widget.submitButtonText ?? "Submit",
          buttonState: ButtonState.error,
        );
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
