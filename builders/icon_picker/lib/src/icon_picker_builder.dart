import 'package:flutter/material.dart';
import 'package:haptics/index.dart';
import 'package:artboard/index.dart';
import 'package:titled_icon/index.dart';
import 'package:icon_picker_builder/src/_components/icon_picker.dart';

import '_components/icon_picker.dart';

//Icon picker must be an artboard
mixin IconPickerArtboardBuilder implements Artboard<TitledIcon> {
  String get title;
  TitledIcon get selectedOption;
  List<TitledIcon> get options;
}

mixin IconPickerBuilderArtboardState<U extends IconPickerArtboardBuilder>
    implements ArtboardState<U> {
  TitledIcon _selectedOption;

  TitledIcon get selectedOption => _selectedOption;
  set selectedOption(TitledIcon newOption) => _selectedOption = newOption;

  Widget buildIconPicker(BuildContext context) {
    return IconPicker(
      title: widget.title,
      options: widget.options,
      selectedOption: selectedOption ?? widget.selectedOption,
      onChanged: _onOptionTap,
    );
  }

  void _onOptionTap(TitledIcon newOption) {
    triggerHapticWith(HapticOption.click);
    selectedOption = newOption;
  }
}
