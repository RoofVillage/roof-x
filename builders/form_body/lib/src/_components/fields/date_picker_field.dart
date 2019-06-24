import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:distance/index.dart' as distance;

import '_picker_field.dart';

class RoofDatePickerField extends StatefulWidget {
  final String title;
  final DateTime initialValue;
  final DateTime startBound;
  final DateTime endBound;
  final bool autofocus;
  final TextInputType keyboardType;
  final Function(DateTime) onChanged;
  final Function(DateTime, BuildContext) onSubmitted;
  final Function(bool) onFocusChanged;
  final Function onTap;
  final FocusNode focusNode;

  RoofDatePickerField({
    this.title,
    this.initialValue,
    this.startBound,
    this.endBound,
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
  final _typographyStyle = typography.bodyPrimary;

  @override
  Widget build(BuildContext context) {
    final String formattedValue =
        widget.initialValue.toLocal().toIso8601String();
    final TextStyle textStyle = _typographyStyle.textStyleWithColor(
      RoofTheme.of(context).color.text.primary,
    );
    final verticalPadding = EdgeInsets.symmetric(vertical: distance.b);

    final fieldBody = Container(
      padding: verticalPadding,
      child: Text(
        formattedValue,
        style: textStyle,
        textAlign: TextAlign.right,
      ),
    );

    return RoofPickerField(
      onTap: widget.onTap,
      name: widget.title,
      fieldBody: fieldBody,
    );
  }
}
