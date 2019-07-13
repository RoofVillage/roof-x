import 'package:form/src/data/interval_frequency_picker_data.dart';

import 'picker_field.dart';

class FormIntervalFrequencyPickerFieldData extends PickerFieldData<FormIntervalFrequencyOptionData> {
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
