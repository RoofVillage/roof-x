import 'package:flutter/material.dart';
import 'package:titled_option_data/index.dart';

import '_roller_column.dart';

mixin RollerColumnBuilder {
  Widget buildRollerColumn<T>(
    BuildContext context, {
    @required List<TitledOptionData<T>> list,
    TitledOptionData<T> selectedValue,
    bool canRollover,
    CrossAxisAlignment crossAxisAlignment,
    void Function(TitledOptionData<T>) onChange,
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
