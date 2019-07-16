import 'package:flutter/material.dart';
import 'package:empty_vertical_floating_artboard_template/index.dart';
import 'package:vertical_floating_artboard_scaffold/index.dart';
import 'package:option_picker_builder/index.dart';
import 'package:titled_value/index.dart';

class OptionPickerVerticalFloatingArtboard<T>
    extends EmptyVerticalFloatingArtboard<List<TitledValue>>
    with OptionPickerArtboardBuilder<T> {
  final String title;
  final String emptyText;
  final List<TitledValue<T>> selectedOptions;
  final List<TitledValue<T>> options;
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
  List<TitledValue<T>> get selectedOptions =>
      VerticalFloatingArtboardNavigatorPanel.of(context, shouldRebuild: false)
          .result;

  @override
  set selectedOptions(List<TitledValue<T>> newSelectedOptions) {
    VerticalFloatingArtboardNavigatorPanel.of(context).result =
        newSelectedOptions;
  }

  @override
  Widget buildBody(BuildContext context) => buildOptionPicker(context);
}
