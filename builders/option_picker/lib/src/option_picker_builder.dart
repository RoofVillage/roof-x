import 'package:flutter/material.dart';
import 'package:haptics/index.dart';
import 'package:artboard/index.dart';
import 'package:option_picker_data/index.dart';

import '_components/option_picker.dart';

//Date pickers must be an artboard
mixin OptionPickerBuilder<T> implements Artboard<OptionPickerData> {
  String get title;
  String get emptyText;
  List<OptionPickerData<T>> get initialSelected => [];
  List<OptionPickerData<T>> get options => [];
  bool get isMultiSelect => false;
}

mixin OptionPickerBuilderState<T, U extends OptionPickerBuilder>
    implements ArtboardState<U> {
  List<OptionPickerData<T>> _selectedOptions;

  List<OptionPickerData<T>> get selectedOptions => _selectedOptions;
  set selectedOptions(List<OptionPickerData<T>> newOptions) =>
      _selectedOptions = newOptions;

  Widget buildOptionPicker(BuildContext context) {
    return OptionPicker<T>(
      title: widget.title,
      emptyText: widget.emptyText,
      initialSelected: widget.initialSelected,
      options: widget.options,
      isMultiSelect: widget.isMultiSelect,
      onChanged: _onChanged,
    );
  }

  void _onChanged(List<OptionPickerData<T>> selectedOptions) {
    triggerHapticWith(HapticOption.click);
    selectedOptions = selectedOptions;
  }
}
