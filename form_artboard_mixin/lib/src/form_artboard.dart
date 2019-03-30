import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:form/index.dart';
import 'package:exceptions/index.dart';
import 'package:keyboard_accessory_components/index.dart';
import 'package:haptics/index.dart';

import 'data/index.dart';
import '_roof_stream_form.dart';

enum FormSubmitState { normal, loading, exception }
mixin FormArtboard {
  List<StreamableFormFieldData> get fieldData => [];
  List<StreamableFormSectionData> get sectionData => [];
  StreamableFormData get formData => null;
  String get submitButtonText;
  bool get canSubmitWitheyboardRaised => true;

  double get fieldHorizontalSpacing => RoofDistance.c;

  Widget get submitKeyboardAccessory => PrimaryActionKeyboardAccessoryButton(
        onTap: (context) {
          _form.resignFocus(context);
          submit(context);
        },
        title: submitButtonText,
      );

  Future<List<StreamableFormFieldData>> get loadedFieldData async {
    return Future<List<StreamableFormFieldData>>.value([]);
  }

  Future<List<StreamableFormSectionData>> get loadedSectionData async {
    return Future<List<StreamableFormSectionData>>.value([]);
  }

  StreamFormBloc get form => _form.bloc;

  final _form = RoofStreamForm();

  // An opportunity for forms to throw an exception before being submitted.
  Future<void> validate() async {}
  Future<void> submit(BuildContext context);

  // An opportunity for forms to setup additional properties before building.
  void setup(BuildContext context) {
    for (final data in fieldData) {
      if (data is FormSwitchData) {
        data.addOnChangedListener((value) async {
          final datePicker = await goToDatePicker(context);
        });
      }
    }
  }

  Future<DateTime> goToDatePicker(BuildContext context);

  _load() async {
    final sectionData = await loadedSectionData;
    final fieldData = await loadedFieldData;
    if (sectionData.isNotEmpty) {
      form.batchInsertSectionData(sectionData);
    } else if (fieldData.isNotEmpty) {
      form.batchInsertFieldData(fieldData);
    }
  }

  Future<void> _validateFields() async {
    return Future.wait(fieldData.map((data) async => await data.validate()));
  }
}

mixin FormArtboardState {
  FormValidationException exception;
  FormSubmitState formSubmitState = FormSubmitState.normal;
  BuildContext get context;

  FormArtboard get formArtboard;

  void setState(dynamic());

  bool _hasSetUp = false;

  RoofStreamForm buildForm(BuildContext context) {
    _setupIfNeeded();

    final formData = _createFormData();

    formArtboard.form.update(formData);

    formArtboard.form.addOnValueChangedListener(_restoreState);

    formArtboard._load();

    return formArtboard._form;
  }

  Future<void> onSubmitButtonTap(BuildContext context) async {
    _disableForm();

    try {
      await formArtboard._validateFields();
      await formArtboard.validate();
    } on FormValidationException catch (e) {
      _handleException(context, e);
      _enableForm();

      ///commented out for testing;
      // return;
    }

    _handleLoading(context);
    await formArtboard.submit(context);
    _restoreState();
    _enableForm();
  }

  void disposeOfForm() => formArtboard._form.dispose();

  void _setupIfNeeded() {
    if (_hasSetUp) return;
    formArtboard.setup(context);
    _hasSetUp = true;
  }

  StreamableFormData _createFormData() {
    if (formArtboard.formData != null) {
      return formArtboard.formData;
    } else if (formArtboard.sectionData.isNotEmpty) {
      return StreamableFormData(
          sectionData: formArtboard.sectionData,
          submitKeyboardAccessory: formArtboard.submitKeyboardAccessory,
          canSubmitWithKeyboardRaised: formArtboard.canSubmitWitheyboardRaised);
    } else {
      return StreamableFormData.withFields(
          fieldData: formArtboard.fieldData,
          fieldHorizontalSpacing: formArtboard.fieldHorizontalSpacing,
          submitKeyboardAccessory: formArtboard.submitKeyboardAccessory,
          canSubmitWithKeyboardRaised: formArtboard.canSubmitWitheyboardRaised);
    }
  }

  void _handleException(
      BuildContext context, FormValidationException exception) {
    this.exception = exception;
    setState(() => formSubmitState = FormSubmitState.exception);
    Haptic.triggerWith(HapticOption.medium);
  }

  void _handleLoading(BuildContext context) {
    if (formSubmitState == FormSubmitState.loading) return;
    setState(() => formSubmitState = FormSubmitState.loading);
  }

  void _restoreState() {
    if (formSubmitState == FormSubmitState.normal) return;
    setState(() => formSubmitState = FormSubmitState.normal);
  }

  void _enableForm() {
    for (final data in formArtboard.fieldData) data.enabled = true;
    formArtboard.form.batchUpdateFieldData(formArtboard.fieldData);
  }

  void _disableForm() {
    for (final data in formArtboard.fieldData) data.enabled = false;
    formArtboard.form.batchUpdateFieldData(formArtboard.fieldData);
  }
}
