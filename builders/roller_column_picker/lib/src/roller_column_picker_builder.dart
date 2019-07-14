import 'package:flutter/material.dart';
import 'package:artboard/index.dart';
import 'package:haptics/index.dart';
import 'package:option_picker_data/index.dart';

import '_components/roller_column_picker.dart';

mixin RollerColumnPickerArtboardBuilder<T> implements Artboard<OptionPickerData<T>> {
  OptionPickerData<T> get selectedValue;
  List<OptionPickerData<T>> get options => [];
}

mixin RollerColumnPickerArtboardBuilderState<T, U extends RollerColumnPickerArtboardBuilder>
    implements ArtboardState<U> {
  OptionPickerData<T> _selectedValue;

  OptionPickerData<T> get selectedValue => _selectedValue;
  set selectedValue(OptionPickerData<T> newValue) => _selectedValue = newValue;

  Widget buildRollerColumnPicker(BuildContext context) {
    return RollerColumnPicker<T>(
      selectedValue: widget.selectedValue,
      options: widget.options,
      onChanged: _onChanged,
    );
  }

  void _onChanged(OptionPickerData<T> newValue) {
    triggerHapticWith(HapticOption.click);
    selectedValue = newValue;
  }
}
