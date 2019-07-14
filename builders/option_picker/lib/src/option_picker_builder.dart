import 'package:flutter/material.dart';
import 'package:haptics/index.dart';
import 'package:artboard/index.dart';
import 'package:option_picker_data/index.dart';

import '_components/option_picker.dart';

// Option pickers must be an artboard
mixin OptionPickerArtboardBuilder<T> implements Artboard<List<OptionPickerData>> {
  String get title;
  String get emptyText;
  List<OptionPickerData<T>> get selectedOptions => [];
  List<OptionPickerData<T>> get options => [];
  bool get isMultiSelect => false;
}

mixin OptionPickerArtboardBuilderState<T, U extends OptionPickerArtboardBuilder>
    implements ArtboardState<U> {
  List<OptionPickerData<T>> _selectedOptions;

  List<OptionPickerData<T>> get selectedOptions => _selectedOptions;
  set selectedOptions(List<OptionPickerData<T>> newOptions) =>
      _selectedOptions = newOptions;

  Widget buildOptionPicker(BuildContext context) {
    return OptionPicker<T>(
      title: widget.title,
      emptyText: widget.emptyText,
      initialSelected: selectedOptions ?? widget.selectedOptions,
      options: widget.options,
      isMultiSelect: widget.isMultiSelect,
      onChanged: _onChanged,
    );
  }

  void _onChanged(List<OptionPickerData<T>> newSelectedOptions) {
    triggerHapticWith(HapticOption.click);
    selectedOptions = newSelectedOptions;
  }
}
