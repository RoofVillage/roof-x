import 'dart:async';

import 'package:flutter/material.dart';
import 'package:button_components/index.dart';
import 'package:typography/index.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';
import 'package:form_artboard_mixin/index.dart';

import 'floating_artboard.dart';
import 'mixins/index.dart';

abstract class FormFloatingArtboard extends FloatingArtboard with FormArtboard {
  String get title;
  String get subtitle => null;
  String get submitButtonText;
  String get auxiliaryDescription => null;
  String get auxiliaryButtonText => null;
  Future<void> submit(BuildContext context);

  @override
  State<StatefulWidget> createState() => _FormFloatingArtboardState();
}

class _FormFloatingArtboardState extends State<FormFloatingArtboard>
    with FloatingArtboardState, FormArtboardState {
  @override
  FormArtboard get formArtboard => widget;

  String get _submitButtonText {
    switch (formSubmitState) {
      case FormSubmitState.exception:
        return exception.message;
      case FormSubmitState.loading:
        return "Loading";
      case FormSubmitState.normal:
        return widget.submitButtonText;
    }
    return null;
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

    print(widget.title);
    print(_submitButtonText);
    final submitButton =
        RoofSubmitButton(text: _submitButtonText, onTap: onSubmitButtonTap);

    final widgets = <Widget>[Text(widget.title, style: headerStyle)];

    if (widget.subtitle != null) {
      widgets.add(Text(widget.subtitle, style: subtitleStyle));
    }

    widgets.addAll([
      Padding(padding: _bodyVerticalPadding, child: buildForm(context)),
      Padding(padding: _buttonVerticalPadding, child: submitButton)
    ]);
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }
}
