import 'package:flutter/material.dart';
import 'package:spec/index.dart';

import '_picker_field.dart';

class RoofDatePickerField extends StatefulWidget {
  final String fieldName;
  final String placeholder;
  final DateTime initialValue;
  final DateTime startDateBound;
  final DateTime endDateBound;
  final bool autofocus;
  final TextInputType keyboardType;
  final Function(String) onChanged;
  final Function(String, BuildContext) onSubmitted;
  final Function(bool) onFocusChanged;
  final Function onTap;
  final FocusNode focusNode;

  RoofDatePickerField({
    this.fieldName,
    this.placeholder,
    this.initialValue,
    this.startDateBound,
    this.endDateBound,
    this.autofocus,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.onFocusChanged,
    this.onTap,
    this.focusNode,
  });

  _RoofDatePickerFieldState createState() => _RoofDatePickerFieldState();
}

class _RoofDatePickerFieldState extends State<RoofDatePickerField> {
  DateTime currentValue;

  void initState() {
    super.initState();
    currentValue = widget.initialValue;
  }

  selectDate() {
    // open date picker with current value and return new value
    DateTime newValue;
    setState(() {
      currentValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final fieldBody = GestureDetector(
      onTap: selectDate,
      child: Container(
        color: Colors.yellow,
        padding: RoofObjectPadding.field1,
        child: Text(currentValue.toLocal().toIso8601String()),
      ),
    );

    return RoofPickerField(
      name: widget.fieldName,
      fieldBody: fieldBody,
    );
  }
}
