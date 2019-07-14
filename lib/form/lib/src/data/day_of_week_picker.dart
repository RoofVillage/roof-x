import 'package:option_picker_data/index.dart';

import 'roller_column_picker.dart';

class FormDayOfWeekPickerFieldData
    extends FormRollerColumnPickerFieldData<int> {
  @override
  List<OptionPickerData<int>> buildOptions() {
    final List<OptionPickerData<int>> _daysList = [
      OptionPickerData(title: "on Monday", data: 0),
      OptionPickerData(title: "on Tuesday", data: 1),
      OptionPickerData(title: "on Wednesday", data: 2),
      OptionPickerData(title: "on Thursday", data: 3),
      OptionPickerData(title: "on Friday", data: 4),
      OptionPickerData(title: "on Saturday", data: 5),
      OptionPickerData(title: "on Sunday", data: 6),
    ];

    return _daysList;
  }

  FormDayOfWeekPickerFieldData({
    String title,
    OptionPickerData<int> selectedDay,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          selectedValue: selectedDay ??
              OptionPickerData(
                title: "on Monday",
                data: 0,
              ),
          size: size,
          isVisible: isVisible,
        );
}
