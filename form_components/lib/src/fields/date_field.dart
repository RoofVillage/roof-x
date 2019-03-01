import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart';

import 'picker_field.dart';

class RoofDateField extends StatelessWidget {
  final String fieldName;
  final String placeholder;
  final int initialValue;
  final TextInputAction textInputAction;
  final Function(String) onChanged;

  RoofDateField(
      {this.fieldName,
      this.placeholder,
      this.initialValue,
      this.textInputAction,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    final fieldBody = _FieldBody(
        placeholder: placeholder,
        initialValue: initialValue,
        textInputAction: textInputAction,
        onChanged: onChanged);

    return RoofPickerField(fieldName: fieldName, body: fieldBody);
  }
}

class _FieldBody extends StatefulWidget {
  final String placeholder;
  final int initialValue;
  final TextInputAction textInputAction;
  final Function(String) onChanged;

  _FieldBody(
      {this.placeholder,
      this.initialValue,
      this.textInputAction,
      this.onChanged});

  _FieldBodyState createState() => _FieldBodyState(
      placeholder: placeholder,
      value: initialValue,
      textInputAction: textInputAction,
      onChanged: onChanged);
}

class _FieldBodyState extends State<_FieldBody> {
  String fieldName;
  String placeholder;
  int value;
  TextInputAction textInputAction;
  Function(String) onChanged;

  _FieldBodyState(
      {this.fieldName,
      this.placeholder,
      this.value,
      this.textInputAction,
      this.onChanged});

  final _fieldTextStyle = RoofTypography.body2;

  _selectDate() {
    DateTime initialDate = value != null
        ? DateTime.fromMillisecondsSinceEpoch(value)
        : DateTime.now();

    // show picker with current value
    showDatePicker(
            context: context,
            initialDate: initialDate,
            firstDate: DateTime(2018),
            lastDate: DateTime(2030))
        .then((date) {
      int newDate = date.millisecondsSinceEpoch;
      setState(() {
        value = newDate;
      });
      onChanged(newDate.toString());
    });
  }

  _formatDate(int value) {
    DateTime formattedDate = DateTime.fromMicrosecondsSinceEpoch(value);
    return formattedDate.toIso8601String();
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    final textValue = value != null ? _formatDate(value) : placeholder;
    final textStyle = value != null
        ? _fieldTextStyle.textStyleWithColor(theme.color.text.primary)
        : _fieldTextStyle.textStyleWithColor(theme.color.text.placeholder);

    return GestureDetector(
        onTap: _selectDate,
        child: Expanded(
            child: Container(child: Text(textValue, style: textStyle))));
  }
}
