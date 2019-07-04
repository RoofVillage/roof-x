import 'package:flutter/material.dart';
import 'package:haptics/index.dart';
import 'package:artboard/index.dart';
import 'package:icon_picker_data/index.dart';
import 'package:icon_picker_builder/src/_components/icon_picker.dart';

import '_components/icon_picker.dart';

//Date pickers must be an artboard
mixin IconPickerBuilder implements Artboard<IconPickerData> {
  String get title;
  IconPickerData get selectedOption;
  List<IconPickerData> get options;
}

mixin IconPickerBuilderState<U extends IconPickerBuilder>
    implements ArtboardState<U> {
  IconPickerData _selectedOption;

  IconPickerData get selectedOption => _selectedOption;
  set selectedOption(IconPickerData newOption) => _selectedOption = newOption;

  Widget buildIconPicker(BuildContext context) {
    return IconPicker(
      title: widget.title,
      options: widget.options,
      selectedOption: selectedOption ?? widget.selectedOption,
      onChanged: _onOptionTap,
    );
  }

  void _onOptionTap(IconPickerData newOption) {
    triggerHapticWith(HapticOption.click);
    selectedOption = newOption;
  }
}
