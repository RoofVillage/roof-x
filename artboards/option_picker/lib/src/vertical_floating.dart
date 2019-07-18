import 'package:flutter/material.dart';
import 'package:empty_vertical_floating_artboard_template/index.dart';
import 'package:vertical_floating_artboard_scaffold/index.dart';
import 'package:option_picker_builder/index.dart';
import 'package:labeled_value/index.dart';

class OptionPickerVerticalFloatingArtboard<T>
    extends EmptyVerticalFloatingArtboard<List<LabeledValue>>
    with OptionPickerArtboardBuilder<T> {
  final String title;
  final String emptyText;
  final List<LabeledValue<T>> selectedOptions;
  final List<LabeledValue<T>> options;
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
  List<LabeledValue<T>> get selectedOptions =>
      VerticalFloatingArtboardNavigatorPanel.of(context, shouldRebuild: false)
          .result;

  @override
  set selectedOptions(List<LabeledValue<T>> newSelectedOptions) {
    VerticalFloatingArtboardNavigatorPanel.of(context).result =
        newSelectedOptions;
  }

  @override
  Widget buildBody(BuildContext context) => buildOptionPicker(context);
}
