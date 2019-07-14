import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:distance/index.dart' as distance;
import 'package:option_picker_data/index.dart';
import 'package:roller_column_builder/index.dart';

class RollerColumnPicker<T> extends StatefulWidget {
  final OptionPickerData<T> selectedValue;
  final List<OptionPickerData<T>> options;
  final Function(OptionPickerData<T>) onChanged;

  RollerColumnPicker({this.selectedValue, this.options, this.onChanged});

  RollerColumnPickerState<T> createState() => RollerColumnPickerState<T>();
}

class RollerColumnPickerState<T> extends State<RollerColumnPicker<T>>
    with RollerColumnBuilder {
  final double _verticalPadding = distance.c;

  OptionPickerData<T> _selectedValue;

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
      canRollover: false,
    );
    return Container(
      padding: EdgeInsets.symmetric(vertical: _verticalPadding),
      child: Center(child: column),
    );
  }

  void _onChange(OptionPickerData<T> newVal) {
    if (_selectedValue != newVal) {
      setState(() {
        _selectedValue = newVal;
      });
      widget.onChanged(_selectedValue);
    }
  }
}
