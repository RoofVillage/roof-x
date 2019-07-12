import 'package:form/src/data/interval_frequency_select_value.dart';

import 'picker_field.dart';

class FormIntervalFrequencyPickerFieldData extends PickerFieldData<FormIntervalFrequencySelectValueData> {
  FormIntervalFrequencyPickerFieldData({
    String title,
    FormIntervalFrequencySelectValueData selectedSchedule,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          initialValue: selectedSchedule,
          size: size,
          isVisible: isVisible,
        );
}
