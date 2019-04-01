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
  Future<List<StreamableFormFieldData>> get fieldData async => Future.value([]);

  Future<List<StreamableFormSectionData>> get sectionData async =>
      Future.value([]);

  Future<StreamableFormData> get formData => null;

  String get submitButtonText;
  bool get canSubmitWitheyboardRaised => true;

  double get fieldHorizontalSpacing => RoofDistance.c;

  StreamFormBloc get form => _form.bloc;

  final _form = RoofStreamForm();

  // An opportunity for forms to throw an exception before being submitted.
  Future<void> validate() async {}
  Future<void> submit(BuildContext context);

  // An opportunity for forms to setup additional properties before building.
  void setup(BuildContext context,
      {@required List<StreamableFormFieldData> fieldData}) async {
    for (final data in fieldData) {
      if (data is FormDateFieldData) _setupDateFieldData(context, data: data);
    }
  }

  Future<Date> goToDatePicker(
      {@required BuildContext context, @required Date selectedDate});

  Future<void> _validateFields() async {
    return Future.wait(
        (await fieldData).map((data) async => await data.validate()));
  }

  Widget _buildSubmitKeyboardAccessory(BuildContext context) {
    return PrimaryActionKeyboardAccessoryButton(
      onTap: (context) {
        _form.resignFocus(context);
        submit(context);
      },
      title: submitButtonText,
    );
  }

  void _setupDateFieldData(BuildContext context,
      {@required FormDateFieldData data}) {
    data.addOnTapListener(() async {
      final newDate =
          await goToDatePicker(context: context, selectedDate: data.value);
      data.value = newDate;
      form.updateFieldData(data);
    });
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
    _load(context);
    formBuilder.form.addOnValueChangedListener(_restoreState);
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

  void _load(BuildContext context) async {
    final formData = await _createFormData(context);
    if (formData == null) return;
    _setupIfNeeded(context, fieldData: formData.fieldData);
    formBuilder.form.update(formData);
  }

  Future<StreamableFormData> _createFormData(BuildContext context) async {
    final formData = await formBuilder.formData;
    if (formData != null) return formData;

    final sectionData = await formBuilder.sectionData;
    if (sectionData.isNotEmpty) {
      return StreamableFormData(
          sectionData: sectionData,
          submitKeyboardAccessory:
              formBuilder._buildSubmitKeyboardAccessory(context),
          canSubmitWithKeyboardRaised: formBuilder.canSubmitWitheyboardRaised);
    }

    final fieldData = await formBuilder.fieldData;
    if (fieldData.isNotEmpty) {
      return StreamableFormData.withFields(
          fieldData: fieldData,
          fieldHorizontalSpacing: formBuilder.fieldHorizontalSpacing,
          submitKeyboardAccessory:
              formBuilder._buildSubmitKeyboardAccessory(context),
          canSubmitWithKeyboardRaised: formBuilder.canSubmitWitheyboardRaised);
    }

    return null;
  }

  void _setupIfNeeded(BuildContext context,
      {@required List<StreamableFormFieldData> fieldData}) {
    if (_hasSetUp) return;
    formBuilder.setup(context, fieldData: fieldData);
    _hasSetUp = true;
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

  void _enableForm() async {
    for (final data in await formBuilder.fieldData) data.enabled = true;
    formBuilder.form.batchUpdateFieldData(await formBuilder.fieldData);
  }

  void _disableForm() async {
    for (final data in await formBuilder.fieldData) data.enabled = false;
    formBuilder.form.batchUpdateFieldData(await formBuilder.fieldData);
  }
}
