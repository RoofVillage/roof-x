import 'package:flutter/material.dart';
import 'package:haptics/index.dart';
import 'package:artboard/index.dart';
import 'package:titled_option_data/index.dart';

import '_components/option_picker.dart';

// Option pickers must be an artboard
mixin OptionPickerArtboardBuilder<T> implements Artboard<List<TitledOptionData>> {
  String get title;
  String get emptyText;
  List<TitledOptionData<T>> get selectedOptions => [];
  List<TitledOptionData<T>> get options => [];
  bool get isMultiSelect => false;
}

mixin OptionPickerArtboardBuilderState<T, U extends OptionPickerArtboardBuilder>
    implements ArtboardState<U> {
  List<TitledOptionData<T>> _selectedOptions;

  List<TitledOptionData<T>> get selectedOptions => _selectedOptions;
  set selectedOptions(List<TitledOptionData<T>> newOptions) =>
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

  void _onChanged(List<TitledOptionData<T>> newSelectedOptions) {
    triggerHapticWith(HapticOption.click);
    selectedOptions = newSelectedOptions;
  }
}
