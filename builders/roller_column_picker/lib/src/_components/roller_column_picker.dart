import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:distance/index.dart' as distance;
import 'package:titled_value/index.dart';
import 'package:roller_column_builder/index.dart';

class RollerColumnPicker<T> extends StatefulWidget {
  final TitledValue<T> selectedValue;
  final List<TitledValue<T>> options;
  final Function(TitledValue<T>) onChanged;
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

  TitledValue<T> _selectedValue;

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

  void _onChange(TitledValue<T> newVal) {
    if (_selectedValue != newVal) {
      setState(() {
        _selectedValue = newVal;
      });
      widget.onChanged(_selectedValue);
    }
  }
}
