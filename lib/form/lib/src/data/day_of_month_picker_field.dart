import 'package:ordinal_suffix_string_from_int/index.dart';
import 'package:titled_option_data/index.dart';

import 'roller_column_picker_field.dart';

class FormDayOfMonthPickerFieldData
    extends FormRollerColumnPickerFieldData<int> {
  @override
  List<TitledOptionData<int>> buildOptions() {
    final List<TitledOptionData<int>> _daysList = [];

    for (int i = 0; i < 30; i++) {
      final data = TitledOptionData(
        title: "on the " + ordinalSuffixString(i + 1),
        data: i,
      );
      _daysList.add(data);
    }
    _daysList.add(
      TitledOptionData(title: "on the last day", data: 30),
    );

    return _daysList;
  }

  FormDayOfMonthPickerFieldData({
    String title,
    TitledOptionData<int> selectedDay,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          selectedValue: selectedDay ??
              TitledOptionData(
                title: "on the " + ordinalSuffixString(1),
                data: 0,
              ),
          size: size,
          isVisible: isVisible,
        );
}
