import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart';
import 'package:spec/index.dart';

import 'widgets/index.dart';

class RoofTextField extends StatelessWidget {
  final String fieldName;
  final String placeholder;
  final String initialValue;
  final bool isPassword;
  final bool autofocus;
  final TextInputAction textInputAction;

  String get _formattedPlaceholder {
    return (placeholder == null && isPassword) ? "••••••••" : placeholder;
  }

  RoofTextField(
      {this.fieldName,
      this.placeholder,
      this.initialValue,
      this.isPassword,
      this.autofocus,
      this.textInputAction});

  @override
  Widget build(BuildContext context) {
    List<Widget> fieldChildren = [];

    if (fieldName != null) {
      fieldChildren.add(RoofFieldLabel(labelText: fieldName));
    }

    final fieldBody = _FieldBody(
      autofocus: autofocus,
      isPassword: isPassword,
      textInputAction: textInputAction,
      initialValue: initialValue,
      placeholder: _formattedPlaceholder,
    );

    fieldChildren.add(fieldBody);

    return Container(
        padding: RoofObjectPadding.field1,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: fieldChildren));
  }
}

class _FieldBody extends StatelessWidget {
  final bool autofocus;
  final bool isPassword;
  final TextInputAction textInputAction;
  final String initialValue;
  final String placeholder;

  final _typographyDecoration = RoofTypography.body2;

  _FieldBody(
      {this.autofocus,
      this.isPassword,
      this.initialValue,
      this.textInputAction,
      this.placeholder});

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    final decoration = InputDecoration(
        hintText: placeholder,
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: theme.color.stroke.light)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: theme.color.stroke.focus)),
        hintStyle: _typographyDecoration
            .textStyleWithColor(theme.color.text.placeholder));

    return TextFormField(
        autofocus: autofocus ?? false,
        obscureText: isPassword ?? false,
        initialValue: initialValue,
        textInputAction: textInputAction,
        decoration: decoration);
  }
}
