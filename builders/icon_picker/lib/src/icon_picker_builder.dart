import 'package:flutter/material.dart';
import 'package:haptics/index.dart';
import 'package:artboard/index.dart';
import 'package:icon_option_data/index.dart';
import 'package:icon_picker_builder/src/_components/icon_picker.dart';

import '_components/icon_picker.dart';

//Icon picker must be an artboard
mixin IconPickerArtboardBuilder implements Artboard<IconOptionData> {
  String get title;
  IconOptionData get selectedOption;
  List<IconOptionData> get options;
}

mixin IconPickerBuilderArtboardState<U extends IconPickerArtboardBuilder>
    implements ArtboardState<U> {
  IconOptionData _selectedOption;

  IconOptionData get selectedOption => _selectedOption;
  set selectedOption(IconOptionData newOption) => _selectedOption = newOption;

  Widget buildIconPicker(BuildContext context) {
    return IconPicker(
      title: widget.title,
      options: widget.options,
      selectedOption: selectedOption ?? widget.selectedOption,
      onChanged: _onOptionTap,
    );
  }

  void _onOptionTap(IconOptionData newOption) {
    triggerHapticWith(HapticOption.click);
    selectedOption = newOption;
  }
}
