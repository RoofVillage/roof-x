import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:distance/index.dart' as distance;
import 'package:titled_option_data/index.dart';
import 'package:roller_column_builder/index.dart';

class RollerColumnPicker<T> extends StatefulWidget {
  final TitledOptionData<T> selectedValue;
  final List<TitledOptionData<T>> options;
  final Function(TitledOptionData<T>) onChanged;
  final bool canRollover;

  RollerColumnPicker({
    this.selectedValue,
    this.options,
    this.onChanged,
    canRollover,
  }) : this.canRollover = canRollover ?? false;

  RollerColumnPickerState<T> createState() => RollerColumnPickerState<T>();
}

class RollerColumnPickerState<T> extends State<RollerColumnPicker<T>>
    with RollerColumnBuilder {
  final double _verticalPadding = distance.c;

  TitledOptionData<T> _selectedValue;

  @override
  void initState() {
    _selectedValue = widget.selectedValue ?? widget.options.first;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Widget column = buildRollerColumn<T>(
      context,
      list: widget.options,
      selectedValue: _selectedValue,
      onChange: _onChange,
      canRollover: widget.canRollover,
    );
    return Container(
      padding: EdgeInsets.symmetric(vertical: _verticalPadding),
      child: Center(child: column),
    );
  }

  void _onChange(TitledOptionData<T> newVal) {
    if (_selectedValue != newVal) {
      setState(() {
        _selectedValue = newVal;
      });
      widget.onChanged(_selectedValue);
    }
  }
}
