import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart' as typography;
import 'package:distance/index.dart' as distance;

import '_picker_field.dart';

class RoofDatePickerField extends StatelessWidget {
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

  final _typographyStyle = typography.bodyPrimary;

  @override
  Widget build(BuildContext context) {
    final String formattedValue = initialValue.toLocal().toIso8601String();
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
      onTap: onTap,
      name: title,
      fieldBody: fieldBody,
    );
  }
}
