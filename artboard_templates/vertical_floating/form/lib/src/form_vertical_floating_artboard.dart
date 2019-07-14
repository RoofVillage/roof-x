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
import 'package:icon_picker_data/index.dart';
import 'package:vertical_floating_artboard_scaffold/index.dart';
import 'package:option_picker_data/index.dart';
import 'package:interval_frequency_schedule_data/index.dart';
import 'package:time_picker_builder/index.dart';
import 'package:time_picker_artboard/index.dart';
import 'package:interval_frequency_picker_artboard/index.dart';
import 'package:interval_frequency_picker_builder/index.dart';
import 'package:roller_column_picker_builder/index.dart';
import 'package:roller_column_picker_artboard/index.dart';
import 'package:frequency_type/index.dart';

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
  }) {
    return DatePickerVerticalFloatingArtboard(
      selectedDate: selectedDate,
      startBound: startBound,
      endBound: endBound,
    );
  }

  @override
  OptionPickerArtboardBuilder buildOptionPicker(
    BuildContext context, {
    String title,
    String emptyText,
    List<OptionPickerData> selectedOptions,
    @required List<OptionPickerData> options,
    bool isMultiSelect,
  }) {
    return OptionPickerVerticalFloatingArtboard(
      title: title,
      emptyText: emptyText,
      selectedOptions: selectedOptions,
      options: options,
      isMultiSelect: isMultiSelect,
    );
  }

  @override
  IconPickerArtboardBuilder buildIconPicker(
    BuildContext context, {
    String title,
    IconPickerData selectedOption,
    @required List<IconPickerData> options,
  }) {
    return IconPickerVerticalFloatingArtboard(
      title: title,
      selectedOption: selectedOption,
      options: options,
    );
  }

  @override
  TimePickerArtboardBuilder buildTimePicker(
    BuildContext context, {
    TimeOfDay selectedTime,
  }) {
    return TimePickerVerticalFloatingArtboard(
      initialValue: selectedTime,
    );
  }

  @override
  IntervalFrequencyPickerArtboardBuilder buildIntervalFrequencyPicker(
    BuildContext context, {
    IntervalFrequencyScheduleData selectedSchedule,
    List<OptionPickerData<int>> intervalList,
    List<OptionPickerData<FrequencyType>> frequencyList,
  }) {
    return IntervalFrequencyPickerVerticalFloatingArtboard(
      selectedValue: selectedSchedule,
      intervalList: intervalList,
      frequencyList: frequencyList,
    );
  }

  @override
  RollerColumnPickerArtboardBuilder<T> buildRollerColumnPicker<T>(
    BuildContext context, {
    OptionPickerData<T> selectedValue,
    List<OptionPickerData<T>> options,
  }) {
    return RollerColumnPickerVerticalFloatingArtboard(
      selectedValue: selectedValue,
      options: options,
    );
  }

  @override
  Future<T> goTo<T>({
    @required BuildContext context,
    @required Artboard<T> artboard,
  }) async {
    return await ArtboardNavigator.of(context).goTo<T>(artboard);
  }

  @override
  void onFocusChanged({
    @required BuildContext context,
    @required bool isInFocus,
  }) {
    ArtboardNavigator.of(context).toggleNavButtonsHidden(isInFocus);
  }
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
