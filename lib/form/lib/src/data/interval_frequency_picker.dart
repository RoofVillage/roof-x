import 'package:form/src/data/interval_frequency_picker_data.dart';
import 'package:option_picker_data/index.dart';
import 'package:frequency_type/index.dart';
import 'package:interval/index.dart';

import 'picker_field.dart';

class FormIntervalFrequencyPickerFieldData
    extends PickerFieldData<FormIntervalFrequencyOptionData> {
  List<OptionPickerData<int>> intervalList = [
    OptionPickerData<int>(title: toIntervalString(0), data: 0),
    OptionPickerData<int>(title: toIntervalString(1), data: 1),
    OptionPickerData<int>(title: toIntervalString(2), data: 2)
  ];

  List<OptionPickerData<FrequencyType>> frequencyList = [
    OptionPickerData<FrequencyType>(
      title: "day",
      data: FrequencyType.fromString("daily"),
    ),
    OptionPickerData<FrequencyType>(
      title: "week",
      data: FrequencyType.fromString("weekly"),
    ),
    OptionPickerData<FrequencyType>(
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
