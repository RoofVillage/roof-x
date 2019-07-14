import 'package:ordinal_suffix_string_from_int/index.dart';
import 'package:option_picker_data/index.dart';

import 'roller_column_picker.dart';

class FormDayOfMonthPickerFieldData
    extends FormRollerColumnPickerFieldData<int> {
  @override
  List<OptionPickerData<int>> buildOptions() {
    final List<OptionPickerData<int>> _daysList = [];

    for (int i = 0; i < 30; i++) {
      final data = OptionPickerData(
        title: "on the " + ordinalSuffixString(i + 1),
        data: i,
      );
      _daysList.add(data);
    }
    _daysList.add(
      OptionPickerData(title: "on the last day", data: 30),
    );

    return _daysList;
  }

  FormDayOfMonthPickerFieldData({
    String title,
    OptionPickerData<int> selectedDay,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          selectedValue: selectedDay ??
              OptionPickerData(
                title: "on the " + ordinalSuffixString(1),
                data: 0,
              ),
          size: size,
          isVisible: isVisible,
        );
}
