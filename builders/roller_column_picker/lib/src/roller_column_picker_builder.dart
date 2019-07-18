import 'package:flutter/material.dart';
import 'package:artboard/index.dart';
import 'package:haptics/index.dart';
import 'package:labeled_value/index.dart';

import '_components/roller_column_picker.dart';

mixin RollerColumnPickerArtboardBuilder<T>
    implements Artboard<LabeledValue<T>> {
  LabeledValue<T> get selectedValue;
  List<LabeledValue<T>> get options => [];
  bool get canRollover => false;
}

mixin RollerColumnPickerArtboardBuilderState<T,
    U extends RollerColumnPickerArtboardBuilder> implements ArtboardState<U> {
  LabeledValue<T> _selectedValue;

  LabeledValue<T> get selectedValue => _selectedValue;
  set selectedValue(LabeledValue<T> newValue) => _selectedValue = newValue;

  Widget buildRollerColumnPicker(BuildContext context) {
    return RollerColumnPicker<T>(
      selectedValue: widget.selectedValue,
      options: widget.options,
      canRollover: widget.canRollover,
      onChanged: _onChanged,
    );
  }

  void _onChanged(LabeledValue<T> newValue) {
    triggerHapticWith(HapticOption.click);
    selectedValue = newValue;
  }
}
