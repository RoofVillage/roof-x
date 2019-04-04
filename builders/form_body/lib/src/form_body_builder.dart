import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:form/index.dart';
import 'package:form_validation_exception/index.dart';
import 'package:haptics/index.dart';
import 'package:date/index.dart';
import 'package:date_picker_builder/index.dart';
import 'package:artboard/index.dart';

import '_components/keyboard_accessory_buttons/index.dart';
import '_components/roof_stream_form.dart';

enum FormSubmitState { normal, loading, exception }

mixin FormBodyBuilder implements StatefulWidget {
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
  void setupFields(BuildContext context,
      {@required List<StreamableFormFieldData> fieldData}) {}

  DatePickerBuilder buildDatePicker(BuildContext context,
      {@required Date selectedDate});

  Future<T> goTo<T>(
      {@required BuildContext context, @required Artboard<T> artboard});
  void onFocusChanged(
      {@required BuildContext context, @required bool isInFocus});

  void _setup(BuildContext context,
      {@required List<StreamableFormFieldData> fieldData}) async {
    for (final data in fieldData) {
      if (data is FormDateFieldData) _setupDateFieldData(context, data: data);
    }
    setupFields(context, fieldData: fieldData);
  }

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
      final artboard = buildDatePicker(context, selectedDate: data.value);
      final time = await goTo<Date>(context: context, artboard: artboard);
      if (time == null) return;
      data.value = time;
      form.updateFieldData(data);
    });
  }

  void disposeOfForm() => _form.dispose();
}

mixin FormBodyBuilderState<T extends FormBodyBuilder> implements State<T> {
  FormValidationException exception;
  FormSubmitState formSubmitState = FormSubmitState.normal;

  bool _hasSetUp = false;

  RoofStreamForm buildForm(BuildContext context) {
    _load(context);
    widget.form.addOnValueChangedListener(_restoreState);
    return widget._form;
  }

  Future<void> onSubmitButtonTap(BuildContext context) async {
    _disableForm();

    try {
      await widget._validateFields();
      await widget.validate();
    } on FormValidationException catch (e) {
      _handleException(context, e);
      _enableForm();

      ///commented out for testing;
      // return;
    }

    _handleLoading(context);
    await widget.submit(context);
    _restoreState();
    _enableForm();
  }

  void addFocusChangedListeners() {
    widget.form.addOnFocusChangedListener((isInFocus) {
      widget.onFocusChanged(context: context, isInFocus: isInFocus);
    });
  }

  void removeFocusListeners() {
    widget.disposeOfForm();
  }

  void _load(BuildContext context) async {
    final formData = await _createFormData(context);
    if (formData == null) return;
    _setupIfNeeded(context, fieldData: formData.fieldData);
    widget.form.update(formData);
  }

  Future<StreamableFormData> _createFormData(BuildContext context) async {
    final formData = await widget.formData;
    if (formData != null) return formData;

    final sectionData = await widget.sectionData;
    if (sectionData.isNotEmpty) {
      return StreamableFormData(
          sectionData: sectionData,
          submitKeyboardAccessory:
              widget._buildSubmitKeyboardAccessory(context),
          canSubmitWithKeyboardRaised: widget.canSubmitWitheyboardRaised);
    }

    final fieldData = await widget.fieldData;
    if (fieldData.isNotEmpty) {
      return StreamableFormData.withFields(
          fieldData: fieldData,
          fieldHorizontalSpacing: widget.fieldHorizontalSpacing,
          submitKeyboardAccessory:
              widget._buildSubmitKeyboardAccessory(context),
          canSubmitWithKeyboardRaised: widget.canSubmitWitheyboardRaised);
    }

    return null;
  }

  void _setupIfNeeded(BuildContext context,
      {@required List<StreamableFormFieldData> fieldData}) {
    if (_hasSetUp) return;
    widget._setup(context, fieldData: fieldData);
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
    for (final data in await widget.fieldData) data.enabled = true;
    widget.form.batchUpdateFieldData(await widget.fieldData);
  }

  void _disableForm() async {
    for (final data in await widget.fieldData) data.enabled = false;
    widget.form.batchUpdateFieldData(await widget.fieldData);
  }

  bool _isFocused = false;
  get isFocused => _isFocused;
  set isFocused(bool isFocused) {
    setState(() {
      _isFocused = isFocused;
    });
  }
}
