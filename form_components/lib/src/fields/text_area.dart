import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart';

import '_composition_field.dart';
import 'widgets/index.dart';

class RoofTextArea extends StatelessWidget {
  final String fieldName;
  final String placeholder;
  final String initialValue;
  final bool autofocus;
  final TextInputAction textInputAction;

  RoofTextArea(
      {this.fieldName,
      this.placeholder,
      this.initialValue,
      this.autofocus = false,
      this.textInputAction});

  @override
  Widget build(BuildContext context) {
    List<Widget> fieldChildren = [];

    if (fieldName != null) {
      fieldChildren.add(RoofFieldLabel(labelText: fieldName));
    }

    fieldChildren.add(_FieldBody());

    return Container(
        margin: RoofObjectPadding.field1,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: fieldChildren));
  }
}

class _FieldBody extends StatelessWidget with RoofCompositionField {
  final bool autofocus;
  final String initialValue;
  final TextInputAction textInputAction;
  final String placeholder;

  final int _maxLines = 3;
  final _typographyDecoration = RoofTypography.body2;

  _FieldBody(
      {this.autofocus,
      this.initialValue,
      this.textInputAction,
      this.placeholder});

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);

    final decoration = InputDecoration(
        hintText: placeholder,
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.color.stroke.light),
            borderRadius: BorderRadius.all(RoofCornerRadius.regular)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.color.stroke.focus),
            borderRadius: BorderRadius.all(RoofCornerRadius.regular)),
        hintStyle: _typographyDecoration
            .textStyleWithColor(theme.color.text.placeholder));

    return Container(
        margin: EdgeInsets.fromLTRB(0, RoofDistance.a, 0, 0),
        child: TextFormField(
            autofocus: autofocus,
            initialValue: initialValue,
            textInputAction: textInputAction,
            maxLines: _maxLines,
            decoration: decoration));
  }
}
