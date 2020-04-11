import 'dart:async';

import 'package:flutter/material.dart';
import 'package:form_builder/index.dart';
import 'package:form_body_builder/index.dart';
import 'package:navigator/index.dart';
import 'package:artboard/index.dart';
import 'package:date/index.dart';
import 'package:date_picker_builder/index.dart';
import 'package:date_picker_artboard/index.dart';
import 'package:option_picker_builder/index.dart';
import 'package:option_picker_artboard/index.dart';
import 'package:button_builder/index.dart';
import 'package:icon_picker_builder/index.dart';
import 'package:icon_picker_artboard/index.dart';
import 'package:labeled_icon/index.dart';
import 'package:vertical_floating_artboard_scaffold/index.dart';
import 'package:labeled_value/index.dart';
import 'package:frequency/index.dart';
import 'package:time_picker_builder/index.dart';
import 'package:time_picker_artboard/index.dart';
import 'package:interval_frequency_picker_artboard/index.dart';
import 'package:interval_frequency_picker_builder/index.dart';
import 'package:roller_column_picker_builder/index.dart';
import 'package:roller_column_picker_artboard/index.dart';
import 'package:tag_editor_artboard/index.dart';
import 'package:tag_editor_builder/index.dart';
import 'package:period_type/index.dart';
import 'package:meta_form_artboard/index.dart';
import 'package:meta_form_artboard_builder/index.dart';

abstract class FormVerticalFloatingArtboard<T> extends StatefulWidget
    with
        VerticalFloatingArtboard<T>,
        Artboard<T>,
        FormBuilder,
        FormBodyBuilder,
        PrimaryCenterButtonBuilder {
  @override
  State<StatefulWidget> createState() => _FormVerticalFloatingArtboardState();

  @override
  DatePickerBuilder buildDatePicker(
    BuildContext context, {
    @required Date selectedDate,
    Date startBound,
    Date endBound,
  }) =>
      DatePickerVerticalFloatingArtboard(
        selectedDate: selectedDate,
        startBound: startBound,
        endBound: endBound,
      );

  @override
  OptionPickerArtboardBuilder buildOptionPicker(
    BuildContext context, {
    String title,
    String emptyText,
    List<LabeledValue> selectedOptions,
    @required List<LabeledValue> options,
    bool isMultiSelect,
  }) =>
      OptionPickerVerticalFloatingArtboard(
        title: title,
        emptyText: emptyText,
        selectedOptions: selectedOptions,
        options: options,
        isMultiSelect: isMultiSelect,
      );

  @override
  IconPickerArtboardBuilder buildIconPicker(
    BuildContext context, {
    String title,
    LabeledIcon selectedOption,
    @required List<LabeledIcon> options,
  }) =>
      IconPickerVerticalFloatingArtboard(
        title: title,
        selectedOption: selectedOption,
        options: options,
      );

  @override
  TimePickerArtboardBuilder buildTimePicker(
    BuildContext context, {
    TimeOfDay selectedTime,
  }) =>
      TimePickerVerticalFloatingArtboard(
        initialValue: selectedTime,
      );

  @override
  IntervalFrequencyPickerArtboardBuilder buildIntervalFrequencyPicker(
    BuildContext context, {
    Frequency selectedSchedule,
    List<LabeledValue<int>> intervalList,
    List<LabeledValue<PeriodType>> periodList,
  }) =>
      IntervalFrequencyPickerVerticalFloatingArtboard(
        selectedValue: selectedSchedule,
        intervalList: intervalList,
        periodList: periodList,
      );

  @override
  RollerColumnPickerArtboardBuilder<T> buildRollerColumnPicker<T>(
    BuildContext context, {
    LabeledValue<T> selectedValue,
    List<LabeledValue<T>> options,
    bool infiniteScroll,
  }) =>
      RollerColumnPickerVerticalFloatingArtboard(
        selectedValue: selectedValue,
        options: options,
        infiniteScroll: infiniteScroll,
      );

  @override
  TagEditorArtboardBuilder buildTagEditor(
    BuildContext context, {
    List<String> tags,
  }) =>
      TagEditorVerticalFloatingArtboard(tags: tags);

  @override
  MetaFormArtboardBuilder<T> buildMetaForm<T>(
    BuildContext context, {
    String title,
    Future<List<StreamableFormFieldData>> fieldsData,
    T Function(List<StreamableFormFieldData>) valueFromFieldsData,
    String submitButtonText,
    void Function() validateForm,
  }) =>
      MetaFormVerticalFloatingArtboard(
        title: title,
        fieldsData: fieldsData,
        valueFromFieldsData: valueFromFieldsData,
        submitButtonText: submitButtonText,
        validateForm: validateForm,
      );

  @override
  Future<T> goTo<T>({
    @required BuildContext context,
    @required Artboard<T> artboard,
  }) async =>
      await ArtboardNavigator.of(context).goTo<T>(artboard);

  @override
  void onFocusChanged({
    @required BuildContext context,
    @required bool isInFocus,
  }) =>
      ArtboardNavigator.of(context).toggleNavButtonsHidden(isInFocus);
}

class _FormVerticalFloatingArtboardState
    extends State<FormVerticalFloatingArtboard>
    with
        VerticalFloatingArtboardState<FormVerticalFloatingArtboard>,
        FormBodyBuilderState<FormVerticalFloatingArtboard>,
        FormBuilderState<FormVerticalFloatingArtboard> {
  @override
  Widget buildBody(BuildContext context) => buildForm(context);
}
