import 'package:flutter/material.dart';
import 'package:roller_column_data/index.dart';

import '_roller_column_picker.dart';

mixin RollerColumnPickerBuilder {
  Widget buildRollerColumnPicker<T>(
    BuildContext context, {
    @required List<RollerColumnData<T>> list,
    RollerColumnData<T> selectedValue,
    bool canRollover,
    Function onChange,
  }) {
    return RollerColumnPicker<T>(
      list: list,
      selectedValue: selectedValue,
      onChange: onChange,
      canRollover: canRollover,
    );
  }
}
