import 'package:titled_value/index.dart';

import 'roller_column_picker_field.dart';

class FormDayOfWeekPickerFieldData
    extends FormRollerColumnPickerFieldData<int> {
  @override
  List<TitledValue<int>> buildOptions() {
    final List<TitledValue<int>> _daysList = [
      TitledValue(title: "on Monday", value: 0),
      TitledValue(title: "on Tuesday", value: 1),
      TitledValue(title: "on Wednesday", value: 2),
      TitledValue(title: "on Thursday", value: 3),
      TitledValue(title: "on Friday", value: 4),
      TitledValue(title: "on Saturday", value: 5),
      TitledValue(title: "on Sunday", value: 6),
    ];

    return _daysList;
  }

  FormDayOfWeekPickerFieldData({
    String title,
    TitledValue<int> selectedDay,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          selectedValue: selectedDay ??
              TitledValue(
                title: "on Monday",
                value: 0,
              ),
          size: size,
          isVisible: isVisible,
        );
}
