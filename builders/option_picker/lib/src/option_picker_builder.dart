import 'package:flutter/material.dart';
import 'package:haptics/index.dart';
import 'package:artboard/index.dart';
import 'package:titled_value/index.dart';

import '_components/option_picker.dart';

// Option pickers must be an artboard
mixin OptionPickerArtboardBuilder<T> implements Artboard<List<TitledValue>> {
  String get title;
  String get emptyText;
  List<TitledValue<T>> get selectedOptions => [];
  List<TitledValue<T>> get options => [];
  bool get isMultiSelect => false;
}

mixin OptionPickerArtboardBuilderState<T, U extends OptionPickerArtboardBuilder>
    implements ArtboardState<U> {
  List<TitledValue<T>> _selectedOptions;

  List<TitledValue<T>> get selectedOptions => _selectedOptions;
  set selectedOptions(List<TitledValue<T>> newOptions) =>
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

  void _onChanged(List<TitledValue<T>> newSelectedOptions) {
    triggerHapticWith(HapticOption.click);
    selectedOptions = newSelectedOptions;
  }
}
