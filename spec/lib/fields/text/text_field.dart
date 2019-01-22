import 'package:flutter/material.dart';
import 'package:spec/fields/widgets/_field_label.dart';
import 'package:spec/field_styles.dart';
import 'package:spec/object_padding.dart';

class RoofTextField extends StatelessWidget {
  final String fieldName;
  final String placeholder;
  final String initialValue;
  final bool isPassword;
  final bool autofocus;
  final TextInputAction textInputAction;

  const RoofTextField(
      {this.fieldName,
      this.placeholder,
      this.initialValue,
      this.isPassword = false,
      this.autofocus = false,
      this.textInputAction});

  @override
  Widget build(BuildContext context) {
    List<Widget> fieldChildren = [];

    String passwordPlaceholder =
        (placeholder == null && isPassword) ? "••••••••" : placeholder;

    if (fieldName != null) {
      Widget fieldLabel = RoofFieldLabel(labelText: fieldName);
      fieldChildren.add(fieldLabel);
    }

    Widget fieldBody = TextFormField(
      autofocus: autofocus,
      obscureText: isPassword,
      textInputAction: textInputAction,
      initialValue: initialValue,
      decoration: RoofFieldStyle.inputDecorationA(
          placeholder: passwordPlaceholder ?? placeholder),
    );

    fieldChildren.add(fieldBody);

    return Container(
        margin: RoofObjectPadding.fieldPaddingA(),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: fieldChildren));
  }
}
