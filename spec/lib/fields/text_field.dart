import 'package:flutter/material.dart';
import 'package:spec/fields/widgets/_field_label.dart';
import 'package:spec/object_padding.dart';
import '_composition_field.dart';

class RoofTextField extends StatelessWidget with RoofCompositionField {
  final String fieldName;
  final String placeholder;
  final String initialValue;
  final bool isPassword;
  final bool autofocus;
  final TextInputAction textInputAction;

  RoofTextField(
      {this.fieldName,
      this.placeholder,
      this.initialValue,
      this.isPassword = false,
      this.autofocus = false,
      this.textInputAction});

  @override
  Widget build(BuildContext context) {
    List<Widget> fieldChildren = [];

    String formattedPlaceholder =
        (placeholder == null && isPassword) ? "••••••••" : placeholder;

    if (fieldName != null)
      fieldChildren.add(RoofFieldLabel(labelText: fieldName));

    fieldChildren.add(_FieldBody(
      autofocus: autofocus,
      isPassword: isPassword,
      textInputAction: textInputAction,
      initialValue: initialValue,
      formattedPlaceholder: formattedPlaceholder,
    ));

    return Container(
        margin: RoofObjectPadding.fieldPaddingA(),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: fieldChildren));
  }
}

class _FieldBody extends StatelessWidget with RoofCompositionField {
  final bool autofocus;
  final bool isPassword;
  final TextInputAction textInputAction;
  final String initialValue;
  final String formattedPlaceholder;

  _FieldBody(
      {this.autofocus,
      this.isPassword,
      this.initialValue,
      this.textInputAction,
      this.formattedPlaceholder});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      obscureText: isPassword,
      initialValue: initialValue,
      textInputAction: textInputAction,
      decoration: _fieldBodyDecoration(placeholder: formattedPlaceholder),
    );
  }

  InputDecoration _fieldBodyDecoration({String placeholder}) {
    return InputDecoration(
        hintText: placeholder,
        enabledBorder: UnderlineInputBorder(borderSide: enabledBorderSide()),
        focusedBorder: UnderlineInputBorder(borderSide: focusedBorderSide()),
        hintStyle: hintStyle());
  }
}