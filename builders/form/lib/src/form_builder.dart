import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:form/index.dart';
import 'package:exceptions/index.dart';
import 'package:haptics/index.dart';
import 'package:date/index.dart';

import 'data/index.dart';
import 'components/index.dart';

enum FormSubmitState { normal, loading, exception }

mixin FormBuilder {
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
      if (data is FormDateFieldData) {
        data.addonTapListener(() async {
          final newDate =
              await goToDatePicker(context: context, selectedDate: data.value);
          data.value = newDate;
          form.updateFieldData(data);
        });
      }
    }
  }

  Future<Date> goToDatePicker(
      {@required BuildContext context, @required Date selectedDate});

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

mixin FormBuilderState {
  FormValidationException exception;
  FormSubmitState formSubmitState = FormSubmitState.normal;
  BuildContext get context;

  FormBuilder get formBuilder;

  void setState(dynamic());

  bool _hasSetUp = false;

  RoofStreamForm buildForm(BuildContext context) {
    _setupIfNeeded();

    final formData = _createFormData();

    formBuilder.form.update(formData);

    formBuilder.form.addOnValueChangedListener(_restoreState);

    formBuilder._load();

    return formBuilder._form;
  }

  Future<void> onSubmitButtonTap(BuildContext context) async {
    _disableForm();

    try {
      await formBuilder._validateFields();
      await formBuilder.validate();
    } on FormValidationException catch (e) {
      _handleException(context, e);
      _enableForm();

      ///commented out for testing;
      // return;
    }

    _handleLoading(context);
    await formBuilder.submit(context);
    _restoreState();
    _enableForm();
  }

  void disposeOfForm() => formBuilder._form.dispose();

  void _setupIfNeeded() {
    if (_hasSetUp) return;
    formBuilder.setup(context);
    _hasSetUp = true;
  }

  StreamableFormData _createFormData() {
    if (formBuilder.formData != null) {
      return formBuilder.formData;
    } else if (formBuilder.sectionData.isNotEmpty) {
      return StreamableFormData(
          sectionData: formBuilder.sectionData,
          submitKeyboardAccessory: formBuilder.submitKeyboardAccessory,
          canSubmitWithKeyboardRaised: formBuilder.canSubmitWitheyboardRaised);
    } else {
      return StreamableFormData.withFields(
          fieldData: formBuilder.fieldData,
          fieldHorizontalSpacing: formBuilder.fieldHorizontalSpacing,
          submitKeyboardAccessory: formBuilder.submitKeyboardAccessory,
          canSubmitWithKeyboardRaised: formBuilder.canSubmitWitheyboardRaised);
    }
  }

  void _handleException(
      BuildContext context, FormValidationException exception) {
    this.exception = exception;
    setState(() => formSubmitState = FormSubmitState.exception);
    triggerHapticWith(HapticOption.medium);
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
    for (final data in formBuilder.fieldData) data.enabled = true;
    formBuilder.form.batchUpdateFieldData(formBuilder.fieldData);
  }

  void _disableForm() {
    for (final data in formBuilder.fieldData) data.enabled = false;
    formBuilder.form.batchUpdateFieldData(formBuilder.fieldData);
  }
}
