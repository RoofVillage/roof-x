import 'package:titled_value/index.dart';
import 'package:period_type/index.dart';
import 'package:interval/index.dart';

import '../options/interval_frequency_option_data.dart';
import 'picker_field.dart';

class FormIntervalFrequencyPickerFieldData
    extends FormPickerFieldData<FormIntervalFrequencyOptionData> {
  List<TitledValue<int>> intervalList = [
    TitledValue<int>(title: toIntervalString(0), value: 0),
    TitledValue<int>(title: toIntervalString(1), value: 1),
    TitledValue<int>(title: toIntervalString(2), value: 2)
  ];

  List<TitledValue<PeriodType>> periodList = [
    TitledValue<PeriodType>(
      title: "day",
      value: PeriodType.fromString("daily"),
    ),
    TitledValue<PeriodType>(
      title: "week",
      value: PeriodType.fromString("weekly"),
    ),
    TitledValue<PeriodType>(
      title: "month",
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
