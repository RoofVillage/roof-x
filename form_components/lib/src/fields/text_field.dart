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
  final Function(String) onChanged;

  RoofTextField(
      {this.fieldName,
      this.placeholder,
      this.initialValue,
      this.isPassword,
      this.autofocus,
      this.textInputAction,
      this.onChanged});

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
        placeholder: placeholder,
        onChanged: onChanged);

    fieldChildren.add(fieldBody);

    return Container(
        padding: RoofObjectPadding.field1,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: fieldChildren));
  }
}

class _FieldBody extends StatefulWidget {
  final bool autofocus;
  final bool isPassword;
  final TextInputAction textInputAction;
  final String initialValue;
  final String placeholder;
  final Function(String) onChanged;

  _FieldBody(
      {this.autofocus,
      this.isPassword,
      this.initialValue,
      this.textInputAction,
      this.placeholder,
      this.onChanged});

  _FieldBodyState createState() => _FieldBodyState(
      autofocus: autofocus,
      isPassword: isPassword,
      textInputAction: textInputAction,
      initialValue: initialValue,
      placeholder: placeholder,
      onChanged: onChanged);
}

class _FieldBodyState extends State<_FieldBody> {
  bool autofocus;
  bool isPassword;
  TextInputAction textInputAction;
  String initialValue;
  String placeholder;
  Function(String) onChanged;

  final _controller = TextEditingController();
  final _typographyStyle = RoofTypography.body2;
  String get _formattedPlaceholder {
    return (placeholder == null && isPassword) ? "••••••••" : placeholder;
  }

  _FieldBodyState(
      {this.autofocus,
      this.isPassword,
      this.textInputAction,
      this.initialValue,
      this.placeholder,
      this.onChanged});

  _controllerUpdated() {
    onChanged(_controller.text);
  }

  @override
  void initState() {
    _controller.text = initialValue;
    _controller.addListener(_controllerUpdated);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    final decoration = InputDecoration(
        hintText: _formattedPlaceholder,
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: theme.color.stroke.light)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: theme.color.stroke.focus)),
        hintStyle: _typographyStyle
            .textStyleWithColor(theme.color.text.placeholder));

    return TextField(
        autofocus: autofocus ?? false,
        obscureText: isPassword ?? false,
        textInputAction: textInputAction,
        decoration: decoration,
        controller: _controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
