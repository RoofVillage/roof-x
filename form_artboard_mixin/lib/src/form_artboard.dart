import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:form/index.dart';
import 'package:exceptions/index.dart';
import 'package:keyboard_accessory_components/index.dart';
import 'package:keyboard_accessory/index.dart';

import '_roof_stream_form.dart';

enum FormSubmitState { normal, loading, exception }
mixin FormArtboard {
  List<StreamableFormFieldData> get fieldData => null;
  List<StreamableFormSectionData> get sectionData => null;
  StreamableFormData get formData => null;
  String get submitButtonText;

  double get fieldHorizontalSpacing => RoofDistance.c;

  Widget get submitKeyboardAccessory => PrimaryActionKeyboardAccessoryButton(
      onTap: (context) {
        _resignFocus(context);
        submit(context);
      },
      title: submitButtonText);

  Future<List<StreamableFormFieldData>> get loadedFieldData async {
    return Future<List<StreamableFormFieldData>>.value(null);
  }

  Future<List<StreamableFormSectionData>> get loadedSectionData async {
    return Future<List<StreamableFormSectionData>>.value(null);
  }

  StreamFormBloc get form => _form.bloc;

  final _form = RoofStreamForm();

  //An opportunity for forms to throw an exception before being submitted.
  Future<void> validate() async {}
  Future<void> submit(BuildContext context);

  _load() async {
    final sectionData = await loadedSectionData;
    if (sectionData != null) {
      return form.batchInsertSectionData(sectionData);
    }

    final fieldData = await loadedFieldData;
    if (fieldData != null) {
      return form.batchInsertFieldData(fieldData);
    }
  }

  Future<void> _validateFields() async {
    return Future.wait(fieldData.map((data) async => await data.validate()));
  }

  void _enableForm() {
    for (final fieldData in fieldData) {
      fieldData.enabled = true;
      form.updateFieldData(fieldData);
    }
  }

  void _disableForm() {
    for (final fieldData in fieldData) {
      fieldData.enabled = false;
      form.updateFieldData(fieldData);
    }
  }

  void _resignFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    KeyboardAccessory.of(context).hide();
  }
}

mixin FormArtboardState {
  FormValidationException exception;
  FormSubmitState formSubmitState = FormSubmitState.normal;

  FormArtboard get formArtboard;

  void setState(dynamic());

  RoofStreamForm buildForm(BuildContext context) {
    StreamableFormData formData;
    if (formArtboard.formData != null) {
      formData = formArtboard.formData;
    } else if (formArtboard.sectionData != null) {
      formData = StreamableFormData(
          sectionData: formArtboard.sectionData,
          submitKeyboardAccessory: formArtboard.submitKeyboardAccessory);
    } else {
      formData = StreamableFormData.withFields(
          fieldData: formArtboard.fieldData,
          fieldHorizontalSpacing: formArtboard.fieldHorizontalSpacing,
          submitKeyboardAccessory: formArtboard.submitKeyboardAccessory);
    }

    if (formData != null) {
      formArtboard.form.update(formData);
    }

    formArtboard.form.onValueChange = () => _restoreState(context);

    formArtboard._load();
    return formArtboard._form;
  }

  Future<void> onSubmitButtonTap(BuildContext context) async {
    formArtboard._disableForm();

    try {
      await formArtboard._validateFields();
      await formArtboard.validate();
    } on FormValidationException catch (e) {
      _handleException(context, e);
      formArtboard._enableForm();
      // return;
    }

    _handleLoading(context);
    await formArtboard.submit(context);
    _restoreState(context);
    formArtboard._enableForm();
  }

  void _handleException(
      BuildContext context, FormValidationException exception) {
    this.exception = exception;
    setState(() => formSubmitState = FormSubmitState.exception);
  }

  void _handleLoading(BuildContext context) {
    if (formSubmitState == FormSubmitState.loading) return;
    setState(() => formSubmitState = FormSubmitState.loading);
  }

  void _restoreState(BuildContext context) {
    if (formSubmitState == FormSubmitState.normal) return;
    setState(() => formSubmitState = FormSubmitState.normal);
  }
}
