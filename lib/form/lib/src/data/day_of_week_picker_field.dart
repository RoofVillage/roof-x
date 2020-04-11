import 'package:labeled_value/index.dart';

import 'roller_column_picker_field.dart';

class FormDayOfWeekPickerFieldData
    extends FormRollerColumnPickerFieldData<int> {
  static final List<LabeledValue<int>> dayOfWeekOptions = [
    LabeledValue(label: "on Monday", value: 0),
    LabeledValue(label: "on Tuesday", value: 1),
    LabeledValue(label: "on Wednesday", value: 2),
    LabeledValue(label: "on Thursday", value: 3),
    LabeledValue(label: "on Friday", value: 4),
    LabeledValue(label: "on Saturday", value: 5),
    LabeledValue(label: "on Sunday", value: 6),
  ];

  FormDayOfWeekPickerFieldData({
    String title,
    LabeledValue<int> selectedDay,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          options: dayOfWeekOptions,
          size: size,
          isVisible: isVisible,
        );
}
