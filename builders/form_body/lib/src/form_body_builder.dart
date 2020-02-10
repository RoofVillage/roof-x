import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form/index.dart';
import 'package:form_validation_exception/index.dart';
import 'package:haptics/index.dart';
import 'package:date/index.dart';
import 'package:date_picker_builder/index.dart';
import 'package:option_picker_builder/index.dart';
import 'package:labeled_value/index.dart';
import 'package:icon_picker_builder/index.dart';
import 'package:labeled_icon/index.dart';
import 'package:time_picker_builder/index.dart';
import 'package:interval_frequency_picker_builder/index.dart';
import 'package:frequency/index.dart';
import 'package:roller_column_picker_builder/index.dart';
import 'package:artboard/index.dart';
import 'package:period_type/index.dart';
import 'package:tag_editor_builder/index.dart';
import '_components/keyboard_accessory_buttons/index.dart';
import '_components/standard_stream_form.dart';
import 'form_status.dart';

mixin FormBodyBuilder implements StatefulWidget {
  Future<List<StreamableFormFieldData>> get initialFieldData async =>
      Future.value([]);

  Future<List<StreamableFormSectionData>> get initialSectionData async =>
      Future.value([]);

  Future<StreamableFormData> get initialFormData => null;

  String get submitButtonText;
  bool get canSubmitWithKeyboardRaised => true;

  double get fieldHorizontalSpacing => 1.0;

  StreamFormBloc get form => _form.bloc;

  final _form = StandardStreamForm();

  // An opportunity for forms to throw an exception before being submitted.
  Future<void> validate() async {}
  Future<void> submit(BuildContext context);

  // An opportunity for forms to setup additional properties before building.
  void setupFields(
    BuildContext context, {
    @required List<StreamableFormFieldData> fieldData,
  }) {}

  DatePickerBuilder buildDatePicker(
    BuildContext context, {
    @required Date selectedDate,
  });

  OptionPickerArtboardBuilder buildOptionPicker(
    BuildContext context, {
    String title,
    String emptyText,
    List<LabeledValue> selectedOptions,
    @required List<LabeledValue> options,
    bool isMultiSelect,
  });

  IconPickerArtboardBuilder buildIconPicker(
    BuildContext context, {
    String title,
    LabeledIcon selectedOption,
    List<LabeledIcon> options,
  });

  TimePickerArtboardBuilder buildTimePicker(
    BuildContext context, {
    TimeOfDay selectedTime,
  });

  IntervalFrequencyPickerArtboardBuilder buildIntervalFrequencyPicker(
    BuildContext context, {
    Frequency selectedSchedule,
    List<LabeledValue<int>> intervalList,
    List<LabeledValue<PeriodType>> periodList,
  });

  RollerColumnPickerArtboardBuilder buildRollerColumnPicker<T>(
    BuildContext context, {
    LabeledValue<T> selectedValue,
    List<LabeledValue<T>> options,
  });

  TagEditorArtboardBuilder buildTagEditor(
    BuildContext context, {
    List<String> tags,
  });

  Future<T> goTo<T>({
    @required BuildContext context,
    @required Artboard<T> artboard,
  });

  void onFocusChanged({
    @required BuildContext context,
    @required bool isInFocus,
  });

  void _setup(
    BuildContext context, {
    @required List<StreamableFormFieldData> fieldData,
  }) async {
    for (final data in fieldData) {
      if (data is FormDatePickerFieldData)
        _setupDateFieldData(context, data: data);
      if (data is FormOptionPickerFieldData)
        _setupOptionPickerFieldData(context, data: data);
      if (data is FormIconPickerFieldData)
        _setupIconPickerFieldData(context, data: data);
      if (data is FormTimePickerFieldData)
        _setupTimePickerFieldData(context, data: data);
      if (data is FormIntervalFrequencyPickerFieldData)
        _setupIntervalFrequencyPickerFieldData(context, data: data);
      if (data is FormRollerColumnPickerFieldData)
        _setupRollerColumnPickerFieldData(context, data: data);
      if (data is FormTagFieldData) _setupTagFieldData(context, data: data);
    }

    setupFields(context, fieldData: fieldData);
  }

  Future<void> _validateFields() async {
    return Future.wait(
      form.formData.fieldData
          .where(
            (data) => data.isVisible,
          )
          .map(
            (data) async => await data.validate(),
          ),
    );
  }

  void _setupDateFieldData(
    BuildContext context, {
    @required FormDatePickerFieldData data,
  }) {
    data.addOnTapListener(() async {
      final artboard = buildDatePicker(
        context,
        selectedDate: data.value,
      );
      final time = await goTo<Date>(
        context: context,
        artboard: artboard,
      );
      if (time == null) return;
      data.value = time;
      form.updateFieldData(data);
    });
  }

  void _setupIconPickerFieldData(
    BuildContext context, {
    @required FormIconPickerFieldData data,
  }) {
    data.addOnTapListener(() async {
      final artboard = buildIconPicker(
        context,
        title: data.title,
        options: data.options
            .map(
              (option) => LabeledIcon(icon: option.icon),
            )
            .toList(),
        selectedOption: data.selectedOption != null
            ? LabeledIcon(icon: data.selectedOption.icon)
            : null,
      );
      final newSelectedOption = await goTo<LabeledIcon>(
        context: context,
        artboard: artboard,
      );
      if (newSelectedOption == null) return;
      data.selectedOption = FormLabeledIcon(
        icon: newSelectedOption.icon,
      );
      form.updateFieldData(data);
    });
  }

  void _setupOptionPickerFieldData<T>(
    BuildContext context, {
    @required FormOptionPickerFieldData data,
  }) {
    data.addOnTapListener(() async {
      final convertedOptions = data.options
          ?.map((option) => LabeledValue(
                label: option.label,
                value: option.value,
              ))
          ?.toList();
      final convertedSelectedOptions = data.selectedOptions
          ?.map((option) => LabeledValue(
                label: option.label,
                value: option.value,
              ))
          ?.toList();
      final artboard = buildOptionPicker(
        context,
        title: data.title,
        selectedOptions: convertedSelectedOptions,
        options: convertedOptions,
      );
      final newSelectedOptions = await goTo<List<LabeledValue>>(
        context: context,
        artboard: artboard,
      );
      if (newSelectedOptions == null) return;
      data.selectedOptions = newSelectedOptions
          .map(
            (option) => FormLabeledValue(
              label: option.label,
              value: option.value,
            ),
          )
          .toList();
      form.updateFieldData(data);
    });
  }

  void _setupTimePickerFieldData(
    BuildContext context, {
    @required FormTimePickerFieldData data,
  }) {
    data.addOnTapListener(() async {
      final artboard = buildTimePicker(
        context,
        selectedTime: data.value,
      );
      final newSelectedTime = await goTo<TimeOfDay>(
        context: context,
        artboard: artboard,
      );
      if (newSelectedTime == null) return;
      data.value = newSelectedTime;
      form.updateFieldData(data);
    });
  }

  void _setupIntervalFrequencyPickerFieldData(
    BuildContext context, {
    @required FormIntervalFrequencyPickerFieldData data,
  }) {
    data.addOnTapListener(() async {
      final artboard = buildIntervalFrequencyPicker(
        context,
        selectedSchedule: Frequency(
          interval: data.value?.interval,
          frequency: data.value?.frequency,
        ),
        periodList: data.periodList,
        intervalList: data.intervalList,
      );
      final newSelectedSchedule = await goTo<Frequency>(
        context: context,
        artboard: artboard,
      );
      if (newSelectedSchedule == null) return;
      data.value = FormIntervalFrequencyOptionData(
        frequency: newSelectedSchedule.frequency,
        interval: newSelectedSchedule.interval,
      );
      form.updateFieldData(data);
    });
  }

  void _setupRollerColumnPickerFieldData(
    BuildContext context, {
    @required FormRollerColumnPickerFieldData data,
  }) {
    data.addOnTapListener(() async {
      final artboard = buildRollerColumnPicker(
        context,
        selectedValue: data.value,
        options: data.buildOptions(),
      );
      final newSelectedValue = await goTo(
        context: context,
        artboard: artboard,
      );
      if (newSelectedValue == null) return;
      data.value = newSelectedValue;
      form.updateFieldData(data);
    });
  }

  void _setupTagFieldData(
    BuildContext context, {
    @required FormTagFieldData data,
  }) {
    data.addOnTapListener(() async {
      final artboard = buildTagEditor(
        context,
        tags: data.tags,
      );
      final newSelectedValue = await goTo(
        context: context,
        artboard: artboard,
      );
      if (newSelectedValue == null) return;
      data.tags = newSelectedValue;
      form.updateFieldData(data);
    });
  }

  void disposeOfForm() => _form.dispose();
}

mixin FormBodyBuilderState<T extends FormBodyBuilder> implements State<T> {
  FormValidationException exception;
  FormSubmitStatus formSubmitState = FormSubmitStatus.ready;

  bool _hasSetUp = false;

  bool _shouldHideButtons = false;
  get shouldHideButtons => _shouldHideButtons;
  set shouldHideButtons(bool shouldHide) {
    setState(
      () => _shouldHideButtons = shouldHide,
    );
  }

  StandardStreamForm buildFormBody(BuildContext context) {
    _load(context);
    widget.form.addOnValueChangedListener(_restoreState);
    return widget._form;
  }

  Future<void> onSubmitButtonTap(BuildContext context) async {
    widget.form.disableFields();

    try {
      await widget._validateFields();
      await widget.validate();
    } on FormValidationException catch (e) {
      _handleException(context, e);
      widget.form.enableFields();

      /// TODO commented out for testing;
      // return;
    }

    _handleLoading(context);
    await widget.submit(context);
    _restoreState();
    widget.form.enableFields();
  }

  void addFocusChangedListeners() {
    widget.form.addOnFocusChangedListener(_focusChangedListener);
  }

  void removeFocusListeners() {
    widget.disposeOfForm();
  }

  void _load(BuildContext context) async {
    //No need to load twice. This line also allows artboards to
    //only need to define the formData that will initially be on screen
    if (widget.form.formData != null) return;

    final formData = await _createInitialFormData(context);
    if (formData == null) return;
    _setupIfNeeded(
      context,
      fieldData: formData.fieldData,
    );
    widget.form.update(formData);
  }

    Widget _buildSubmitKeyboardAccessory(BuildContext context) {
    return PrimaryActionKeyboardAccessoryButton(
      onTap: () {
        widget._form.resignFocus(context);
        onSubmitButtonTap(context);
      },
      title: widget.submitButtonText,
    );
  }

  Future<StreamableFormData> _createInitialFormData(
    BuildContext context,
  ) async {
    final formData = await widget.initialFormData;
    if (formData != null) return formData;

    final sectionData = await widget.initialSectionData;
    if (sectionData.isNotEmpty) {
      return StreamableFormData(
        sectionData: sectionData,
        submitKeyboardAccessory: _buildSubmitKeyboardAccessory(context),
        canSubmitWithKeyboardRaised: widget.canSubmitWithKeyboardRaised,
      );
    }

    final fieldData = await widget.initialFieldData;

    if (fieldData.isNotEmpty) {
      return StreamableFormData.withFields(
        fieldData: fieldData,
        fieldHorizontalSpacing: widget.fieldHorizontalSpacing,
        submitKeyboardAccessory: _buildSubmitKeyboardAccessory(context),
        canSubmitWithKeyboardRaised: widget.canSubmitWithKeyboardRaised,
      );
    }

    return null;
  }

  void _setupIfNeeded(
    BuildContext context, {
    @required List<StreamableFormFieldData> fieldData,
  }) {
    if (_hasSetUp) return;
    widget._setup(context, fieldData: fieldData);
    _hasSetUp = true;
  }

  void _handleException(
    BuildContext context,
    FormValidationException exception,
  ) {
    this.exception = exception;
    setState(() => formSubmitState = FormSubmitStatus.exception);
    triggerHapticWith(HapticOption.medium);
  }

  void _handleLoading(BuildContext context) {
    if (formSubmitState == FormSubmitStatus.loading) return;
    setState(() => formSubmitState = FormSubmitStatus.loading);
  }

  void _restoreState() {
    if (formSubmitState == FormSubmitStatus.ready) return;
    setState(() => formSubmitState = FormSubmitStatus.ready);
  }

  void _focusChangedListener(bool isInFocus) {
    shouldHideButtons = isInFocus;
    widget.onFocusChanged(context: context, isInFocus: isInFocus);
  }
}
