import 'package:flutter/material.dart';
import 'package:roofui_kit/util/roofui_field_styles.dart';
import 'package:roofui_kit/fields/widgets/index.dart';

class _RoofUITextFieldState extends State<RoofUITextField> {
  String fieldNameText;
  String placeholderText;
  String initialValueText;
  bool isPassword;
  bool autofocus;
  TextInputAction textInputAction;

  _RoofUITextFieldState(
      {this.fieldNameText,
      this.placeholderText,
      this.initialValueText,
      this.isPassword,
      this.autofocus,
      this.textInputAction});

  Widget build(BuildContext context) {
    List<Widget> fieldChildren = [];

    if (fieldNameText != null)
      fieldChildren.add(RoofUIFieldLabel(labelText: fieldNameText));

    fieldChildren.add(TextFormField(
      autofocus: autofocus,
      obscureText: isPassword,
      textInputAction: textInputAction,
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

class RoofUITextField extends StatefulWidget {
  final String fieldNameText;
  final String placeholderText;
  final String initialValueText;
  final bool isPassword;
  final bool autofocus;
  final TextInputAction textInputAction;

  const RoofUITextField(
      {this.fieldNameText,
      this.placeholderText,
      this.initialValueText,
      this.isPassword = false,
      this.autofocus = false,
      this.textInputAction});

  @override
  _RoofUITextFieldState createState() => _RoofUITextFieldState(
      fieldNameText: fieldNameText,
      placeholderText: placeholderText,
      initialValueText: initialValueText,
      isPassword: isPassword,
      autofocus: autofocus,
      textInputAction: textInputAction);
}
