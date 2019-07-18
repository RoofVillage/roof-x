import 'package:flutter/material.dart';
import 'package:labeled_value/index.dart';

import '_roller_column.dart';

mixin RollerColumnBuilder {
  Widget buildRollerColumn<T>(
    BuildContext context, {
    @required List<LabeledValue<T>> list,
    LabeledValue<T> selectedValue,
    bool canRollover,
    CrossAxisAlignment crossAxisAlignment,
    void Function(LabeledValue<T>) onChange,
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
