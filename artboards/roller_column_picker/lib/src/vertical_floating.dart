import 'package:flutter/material.dart';
import 'package:empty_vertical_floating_artboard_template/index.dart';
import 'package:vertical_floating_artboard_scaffold/index.dart';
import 'package:roller_column_picker_builder/index.dart';
import 'package:labeled_value/index.dart';

class RollerColumnPickerVerticalFloatingArtboard<T>
    extends EmptyVerticalFloatingArtboard<LabeledValue<T>>
    with RollerColumnPickerArtboardBuilder<T> {
  final LabeledValue<T> selectedValue;
  final List<LabeledValue<T>> options;
  bool infiniteScroll;

  RollerColumnPickerVerticalFloatingArtboard({
    this.selectedValue,
    this.options,
    bool infiniteScroll,
  }) : this.infiniteScroll = infiniteScroll ?? false;

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
  LabeledValue<T> get selectedValue =>
      VerticalFloatingArtboardNavigatorPanel.of(context, shouldRebuild: false)
          .result;

  @override
  set selectedValue(LabeledValue<T> newSelectedValue) {
    VerticalFloatingArtboardNavigatorPanel.of(context).result =
        newSelectedValue;
  }

  @override
  Widget buildBody(BuildContext context) => buildRollerColumnPicker(context);
}
