import 'package:titled_option_data/index.dart';

import 'roller_column_picker.dart';

class FormDayOfWeekPickerFieldData
    extends FormRollerColumnPickerFieldData<int> {
  @override
  List<TitledOptionData<int>> buildOptions() {
    final List<TitledOptionData<int>> _daysList = [
      TitledOptionData(title: "on Monday", data: 0),
      TitledOptionData(title: "on Tuesday", data: 1),
      TitledOptionData(title: "on Wednesday", data: 2),
      TitledOptionData(title: "on Thursday", data: 3),
      TitledOptionData(title: "on Friday", data: 4),
      TitledOptionData(title: "on Saturday", data: 5),
      TitledOptionData(title: "on Sunday", data: 6),
    ];

    return _daysList;
  }

  FormDayOfWeekPickerFieldData({
    String title,
    TitledOptionData<int> selectedDay,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          selectedValue: selectedDay ??
              TitledOptionData(
                title: "on Monday",
                data: 0,
              ),
          size: size,
          isVisible: isVisible,
        );
}
