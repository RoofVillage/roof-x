import 'package:flutter/material.dart';
import 'package:roofui_kit/util/roofui_field_styles.dart';
import 'package:roofui_kit/fields/label/index.dart';

class RoofUITextField extends StatelessWidget {
  final String fieldNameText;
  final String placeholderText;
  final String initialValueText;
  final TextInputAction textInputAction;
  final bool isPassword;
  final bool autofocus;

  const RoofUITextField(
      {this.fieldNameText,
      this.placeholderText,
      this.initialValueText,
      this.isPassword = false,
      this.autofocus = false,
      this.textInputAction = TextInputAction.next});

  Widget build(BuildContext context) {
    List<Widget> fieldChildren = [];
    if (fieldNameText != null)
      fieldChildren.add(RoofUIFieldLabel(labelText: fieldNameText));
    fieldChildren.add(TextFormField(
      autofocus: autofocus,
      obscureText: isPassword,
      textInputAction: textInputAction,
      key: this.key,
      initialValue: initialValueText,
      decoration: FieldStyle.inputDecorationA(placeholderText: placeholderText),
    ));

    return Container(
      margin: FieldStyle.standardFieldPadding(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: fieldChildren,
      ),
    );
  }
}
