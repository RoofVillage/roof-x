import 'package:flutter/material.dart';
import 'package:empty_vertical_floating_artboard_template/index.dart';
import 'package:vertical_floating_artboard_scaffold/index.dart';
import 'package:option_picker_builder/index.dart';
import 'package:titled_option_data/index.dart';

class OptionPickerVerticalFloatingArtboard<T>
    extends EmptyVerticalFloatingArtboard<List<TitledOptionData>>
    with OptionPickerArtboardBuilder<T> {
  final String title;
  final String emptyText;
  final List<TitledOptionData<T>> selectedOptions;
  final List<TitledOptionData<T>> options;
  final bool isMultiSelect;

  OptionPickerVerticalFloatingArtboard({
    this.title,
    this.emptyText,
    this.selectedOptions,
    @required this.options,
    bool isMultiSelect,
  }) : isMultiSelect = isMultiSelect ?? false;

  _OptionPickerVerticalFloatingArtboardState<T> createState() =>
      _OptionPickerVerticalFloatingArtboardState<T>();
}

class _OptionPickerVerticalFloatingArtboardState<T>
    extends State<OptionPickerVerticalFloatingArtboard<T>>
    with
        VerticalFloatingArtboardState<OptionPickerVerticalFloatingArtboard<T>>,
        OptionPickerArtboardBuilderState<T, OptionPickerVerticalFloatingArtboard<T>> {
  @override
  List<TitledOptionData<T>> get selectedOptions =>
      VerticalFloatingArtboardNavigatorPanel.of(context, shouldRebuild: false)
          .result;

  @override
  set selectedOptions(List<TitledOptionData<T>> newSelectedOptions) {
    VerticalFloatingArtboardNavigatorPanel.of(context).result =
        newSelectedOptions;
  }

  @override
  Widget buildBody(BuildContext context) => buildOptionPicker(context);
}
