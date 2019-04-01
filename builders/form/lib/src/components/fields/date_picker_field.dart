import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:typography/index.dart';
import 'package:theme/index.dart';
import 'package:haptics/index.dart';

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
  void _onTap() {
    triggerHapticWith(HapticOption.light);
    widget.onTap();

    // open date picker with current value and return new value
    // DateTime newValue;
    // setState(() {
    //   currentValue = newValue;
    // });
  }

  final _typographyStyle = RoofTypography.bodyPrimary;

  @override
  Widget build(BuildContext context) {
    final String formattedValue =
        widget.initialValue.toLocal().toIso8601String();
    final TextStyle textStyle = _typographyStyle.textStyleWithColor(
      RoofTheme.of(context).color.text.primary,
    );

    final fieldBody = GestureDetector(
      onTap: _onTap,
      child: Container(
        padding: RoofObjectPadding.field1,
        child: Text(
          formattedValue,
          style: textStyle,
        ),
      ),
    );

    return RoofPickerField(
      name: widget.title,
      fieldBody: fieldBody,
    );
  }
}
