import 'package:flutter/material.dart';
import 'package:spec/object_padding.dart';
import 'package:spec/distance.dart';
import 'package:spec/fields/widgets/_field_label.dart';

import 'package:spec/color.dart';
import 'package:spec/corner_radius.dart';

class RoofTextArea extends StatelessWidget {
  final String fieldName;
  final String placeholder;
  final String initialValue;
  final bool autofocus;
  final TextInputAction textInputAction;

  const RoofTextArea(
      {this.fieldName,
      this.placeholder,
      this.initialValue,
      this.autofocus = false,
      this.textInputAction});

  @override
  Widget build(BuildContext context) {
    List<Widget> fieldChildren = [];

    if (fieldName != null) {
      Widget fieldLabel = RoofFieldLabel(labelText: fieldName);
      fieldChildren.add(fieldLabel);
    }

    fieldChildren.add(_FieldBody());

    return Container(
        margin: RoofObjectPadding.fieldPaddingA(),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: fieldChildren));
  }
}

class _FieldBody extends StatelessWidget {
  final String initialValue;
  final TextInputAction textInputAction;
  final String fieldName;
  final String placeholder;

  const _FieldBody(
      {this.initialValue,
      this.textInputAction,
      this.fieldName,
      this.placeholder});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, RoofDistance.a, 0, 0),
        child: TextFormField(
            textInputAction: textInputAction,
            maxLines: 3,
            initialValue: initialValue,
            decoration: _decoration(borderSideColor: RoofColor.neutralColorD)));
  }

  InputDecoration _decoration({Color borderSideColor}) {
    return InputDecoration(
        labelText: fieldName,
        hintText: placeholder,
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderSideColor),
            borderRadius: BorderRadius.all(RoofCornerRadius.regular)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: RoofColor.neutralColorF),
            borderRadius: BorderRadius.all(RoofCornerRadius.regular)),
        hintStyle: TextStyle(color: RoofColor.neutralColorD));
  }
}
