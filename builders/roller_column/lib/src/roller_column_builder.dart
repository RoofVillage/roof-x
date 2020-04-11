import 'package:flutter/material.dart';
import 'package:labeled_value/index.dart';

import '_roller_column.dart';

mixin RollerColumnBuilder {
  Widget buildRollerColumn<T>(
    BuildContext context, {
    @required List<LabeledValue<T>> list,
    LabeledValue<T> selectedValue,
    bool infiniteScroll,
    CrossAxisAlignment crossAxisAlignment,
    void Function(LabeledValue<T>) onChange,
  }) =>
      RollerColumn<T>(
        list: list,
        selectedValue: selectedValue,
        infiniteScroll: infiniteScroll,
        crossAxisAlignment: crossAxisAlignment,
        onChange: onChange,
      );
}
