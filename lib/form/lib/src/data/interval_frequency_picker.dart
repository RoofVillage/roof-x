import 'package:form/src/data/interval_frequency_picker_data.dart';
import 'package:titled_option_data/index.dart';
import 'package:frequency_type/index.dart';
import 'package:interval/index.dart';

import 'picker_field.dart';

class FormIntervalFrequencyPickerFieldData
    extends PickerFieldData<FormIntervalFrequencyOptionData> {
  List<TitledOptionData<int>> intervalList = [
    TitledOptionData<int>(title: toIntervalString(0), data: 0),
    TitledOptionData<int>(title: toIntervalString(1), data: 1),
    TitledOptionData<int>(title: toIntervalString(2), data: 2)
  ];

  List<TitledOptionData<FrequencyType>> frequencyList = [
    TitledOptionData<FrequencyType>(
      title: "day",
      data: FrequencyType.fromString("daily"),
    ),
    TitledOptionData<FrequencyType>(
      title: "week",
      data: FrequencyType.fromString("weekly"),
    ),
    TitledOptionData<FrequencyType>(
      title: "month",
      data: FrequencyType.fromString("monthly"),
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
