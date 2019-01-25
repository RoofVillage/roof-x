import 'package:flutter/material.dart';
import 'package:spec/object_padding.dart';
import 'package:spec/distance.dart';
import 'package:spec/fields/widgets/_field_label.dart';
import 'package:spec/color.dart';
import 'package:spec/corner_radius.dart';
import '_composition_field.dart';

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

    if (fieldName != null)
      fieldChildren.add(RoofFieldLabel(labelText: fieldName));

    fieldChildren.add(_FieldBody());

    return Container(
        margin: RoofObjectPadding.fieldPaddingA(),
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

  _FieldBody(
      {this.autofocus,
      this.initialValue,
      this.textInputAction,
      this.placeholder});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, RoofDistance.a, 0, 0),
        child: TextFormField(
            autofocus: autofocus,
            initialValue: initialValue,
            textInputAction: textInputAction,
            maxLines: 3,
            decoration:
                _textAreaDecoration(borderSideColor: RoofColor.neutralColorD)));
  }

  InputDecoration _textAreaDecoration({Color borderSideColor}) {
    return InputDecoration(
        hintText: placeholder,
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
            borderSide: enabledBorderSide(),
            borderRadius: BorderRadius.all(RoofCornerRadius.regular)),
        focusedBorder: OutlineInputBorder(
            borderSide: focusedBorderSide(),
            borderRadius: BorderRadius.all(RoofCornerRadius.regular)),
        hintStyle: hintStyle());
  }
}
