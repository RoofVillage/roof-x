import 'package:flutter/material.dart';
import 'package:empty_vertical_floating_artboard_template/index.dart';
import 'package:vertical_floating_artboard_scaffold/index.dart';
import 'package:roller_column_picker_builder/index.dart';
import 'package:option_picker_data/index.dart';

class RollerColumnPickerVerticalFloatingArtboard<T>
    extends EmptyVerticalFloatingArtboard<OptionPickerData<T>> with RollerColumnPickerArtboardBuilder<T> {
  final OptionPickerData<T> selectedValue;
  final List<OptionPickerData<T>> options;

  RollerColumnPickerVerticalFloatingArtboard({
    this.selectedValue,
    this.options,
  });

  _RollerColumnPickerVerticalFloatingArtboardState<T> createState() =>
      _RollerColumnPickerVerticalFloatingArtboardState<T>();
}

class _RollerColumnPickerVerticalFloatingArtboardState<T>
    extends State<RollerColumnPickerVerticalFloatingArtboard<T>>
    with
        VerticalFloatingArtboardState<
            RollerColumnPickerVerticalFloatingArtboard<T>>,
        RollerColumnPickerArtboardBuilderState<T,
            RollerColumnPickerVerticalFloatingArtboard<T>> {
  @override
  OptionPickerData<T> get selectedValue =>
      VerticalFloatingArtboardNavigatorPanel.of(context, shouldRebuild: false)
          .result;

  @override
  set selectedValue(OptionPickerData<T> newSelectedValue) {
    VerticalFloatingArtboardNavigatorPanel.of(context).result =
        newSelectedValue;
  }

  @override
  Widget buildBody(BuildContext context) => buildRollerColumnPicker(context);
}
