import 'package:ordinal_suffix_string_from_int/index.dart';
import 'package:titled_value/index.dart';

import 'roller_column_picker_field.dart';

class FormDayOfMonthPickerFieldData
    extends FormRollerColumnPickerFieldData<int> {
  @override
  List<TitledValue<int>> buildOptions() {
    final List<TitledValue<int>> _daysList = [];

    for (int i = 0; i < 30; i++) {
      final data = TitledValue(
        title: "on the " + ordinalSuffixString(i + 1),
        value: i,
      );
      _daysList.add(data);
    }
    _daysList.add(
      TitledValue(title: "on the last day", value: 30),
    );

    return _daysList;
  }

  FormDayOfMonthPickerFieldData({
    String title,
    TitledValue<int> selectedDay,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          selectedValue: selectedDay ??
              TitledValue(
                title: "on the " + ordinalSuffixString(1),
                value: 0,
              ),
          size: size,
          isVisible: isVisible,
        );
}
