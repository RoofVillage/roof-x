import 'package:form/src/data/field.dart';
import 'package:labeled_value/index.dart';
import 'package:period_type/index.dart';
import 'package:interval/index.dart';

import '_mixins/on_tap_listener_adder.dart';
import '../options/interval_frequency_option_data.dart';

class FormIntervalFrequencyPickerFieldData
    extends StreamableFormFieldData<FormIntervalFrequencyOptionData>
    with OnTapListenerAdder {
  final List<LabeledValue<int>> intervalList = [
    LabeledValue<int>(label: toIntervalString(0), value: 0),
    LabeledValue<int>(label: toIntervalString(1), value: 1),
    LabeledValue<int>(label: toIntervalString(2), value: 2)
  ];

  final List<LabeledValue<PeriodType>> periodList = [
    LabeledValue<PeriodType>(
      label: "day",
      value: PeriodType.fromString("daily"),
    ),
    LabeledValue<PeriodType>(
      label: "week",
      value: PeriodType.fromString("weekly"),
    ),
    LabeledValue<PeriodType>(
      label: "month",
      value: PeriodType.fromString("monthly"),
    )
  ];

  FormIntervalFrequencyPickerFieldData({
    String title,
    FormIntervalFrequencyOptionData selectedSchedule,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          initialValue: selectedSchedule,
          size: size,
          isVisible: isVisible,
        );
}
