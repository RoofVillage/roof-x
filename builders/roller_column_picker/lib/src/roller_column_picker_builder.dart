import 'package:flutter/material.dart';
import 'package:artboard/index.dart';
import 'package:haptics/index.dart';
import 'package:titled_option_data/index.dart';

import '_components/roller_column_picker.dart';

mixin RollerColumnPickerArtboardBuilder<T> implements Artboard<TitledOptionData<T>> {
  TitledOptionData<T> get selectedValue;
  List<TitledOptionData<T>> get options => [];
}

mixin RollerColumnPickerArtboardBuilderState<T, U extends RollerColumnPickerArtboardBuilder>
    implements ArtboardState<U> {
  TitledOptionData<T> _selectedValue;

  TitledOptionData<T> get selectedValue => _selectedValue;
  set selectedValue(TitledOptionData<T> newValue) => _selectedValue = newValue;

  Widget buildRollerColumnPicker(BuildContext context) {
    return RollerColumnPicker<T>(
      selectedValue: widget.selectedValue,
      options: widget.options,
      onChanged: _onChanged,
    );
  }

  void _onChanged(TitledOptionData<T> newValue) {
    triggerHapticWith(HapticOption.click);
    selectedValue = newValue;
  }
}
