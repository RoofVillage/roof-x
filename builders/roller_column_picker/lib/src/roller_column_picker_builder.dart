import 'package:flutter/material.dart';
import 'package:artboard/index.dart';
import 'package:haptics/index.dart';
import 'package:titled_value/index.dart';

import '_components/roller_column_picker.dart';

mixin RollerColumnPickerArtboardBuilder<T>
    implements Artboard<TitledValue<T>> {
  TitledValue<T> get selectedValue;
  List<TitledValue<T>> get options => [];
  bool get canRollover => false;
}

mixin RollerColumnPickerArtboardBuilderState<T,
    U extends RollerColumnPickerArtboardBuilder> implements ArtboardState<U> {
  TitledValue<T> _selectedValue;

  TitledValue<T> get selectedValue => _selectedValue;
  set selectedValue(TitledValue<T> newValue) => _selectedValue = newValue;

  Widget buildRollerColumnPicker(BuildContext context) {
    return RollerColumnPicker<T>(
      selectedValue: widget.selectedValue,
      options: widget.options,
      canRollover: widget.canRollover,
      onChanged: _onChanged,
    );
  }

  void _onChanged(TitledValue<T> newValue) {
    triggerHapticWith(HapticOption.click);
    selectedValue = newValue;
  }
}
