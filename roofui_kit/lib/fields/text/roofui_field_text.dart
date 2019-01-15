import 'package:flutter/material.dart';
import 'package:roofui_kit/util/roofui_field_styles.dart';
import 'package:roofui_kit/fields/label/index.dart';

class RoofUITextField extends StatelessWidget {
  final String fieldNameText;
  final String placeholderText;
  final String initialValueText;
  final bool isPassword;

  const RoofUITextField(
      {this.fieldNameText, this.placeholderText, this.initialValueText, this.isPassword = false});

  Widget build(BuildContext context) {
    return Container(
      margin: FieldStyle.standardFieldPadding(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RoofUIFieldLabel(labelText: fieldNameText),
          TextFormField(
            obscureText: isPassword,
            key: this.key,
            initialValue: initialValueText,
            decoration:
                FieldStyle.inputDecorationA(placeholderText: placeholderText),
          )
        ],
      ),
    );
  }
}