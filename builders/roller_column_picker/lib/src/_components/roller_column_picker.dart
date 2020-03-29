import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:labeled_value/index.dart';
import 'package:roller_column_builder/index.dart';
import 'package:semantic_theme/index.dart';

class RollerColumnPicker<T> extends StatefulWidget {
  final LabeledValue<T> selectedValue;
  final List<LabeledValue<T>> options;
  final Function(LabeledValue<T>) onChanged;
  final bool infiniteScroll;

  RollerColumnPicker({
    this.selectedValue,
    this.options,
    this.onChanged,
    bool infiniteScroll,
  }) : this.infiniteScroll = infiniteScroll ?? false;

  RollerColumnPickerState<T> createState() => RollerColumnPickerState<T>();
}

class RollerColumnPickerState<T> extends State<RollerColumnPicker<T>>
    with RollerColumnBuilder {
  LabeledValue<T> _selectedValue;

  @override
  void initState() {
    _selectedValue = widget.selectedValue ?? widget.options.first;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = SemanticTheme.of(context);

    final Widget column = buildRollerColumn<T>(
      context,
      list: widget.options,
      selectedValue: _selectedValue,
      onChange: _onChange,
      infiniteScroll: widget.infiniteScroll,
    );
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: theme.distance.padding.vertical.medium,
      ),
      child: Center(child: column),
    );
  }

  void _onChange(LabeledValue<T> newVal) {
    if (_selectedValue != newVal) {
      setState(() {
        _selectedValue = newVal;
      });
      widget.onChanged(_selectedValue);
    }
  }
}
