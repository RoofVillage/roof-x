import 'package:flutter/material.dart';
import 'package:option_picker_data/index.dart';

import '_roller_column.dart';

mixin RollerColumnBuilder {
  Widget buildRollerColumn<T>(
    BuildContext context, {
    @required List<OptionPickerData<T>> list,
    OptionPickerData<T> selectedValue,
    bool canRollover,
    CrossAxisAlignment crossAxisAlignment,
    void Function(OptionPickerData<T>) onChange,
  }) {
    return RollerColumn<T>(
      list: list,
      selectedValue: selectedValue,
      canRollover: canRollover,
      crossAxisAlignment: crossAxisAlignment,
      onChange: onChange,
    );
  }
}
