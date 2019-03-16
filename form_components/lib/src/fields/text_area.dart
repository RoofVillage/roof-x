import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart';

import 'widgets/index.dart';

class RoofTextArea extends StatelessWidget {
  final String fieldName;
  final String placeholder;
  final String initialValue;
  final bool autofocus;
  final TextInputAction textInputAction;
  final Function(String) onChanged;

  RoofTextArea(
      {this.fieldName,
      this.placeholder,
      this.initialValue,
      this.autofocus,
      this.textInputAction,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    List<Widget> fieldChildren = [];

    if (fieldName != null) {
      fieldChildren.add(RoofFieldLabel(labelText: fieldName));
    }

    fieldChildren.add(_FieldBody2(
        autofocus: autofocus,
        initialValue: initialValue,
        placeholder: placeholder,
        textInputAction: textInputAction,
        onChanged: onChanged));

    return Container(
        margin: RoofObjectPadding.field1,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: fieldChildren));
  }
}

class _FieldBody2 extends StatefulWidget {
  final bool autofocus;
  final String initialValue;
  final String placeholder;
  final TextInputAction textInputAction;
  final Function(String) onChanged;

  _FieldBody2(
      {this.autofocus,
      this.initialValue,
      this.textInputAction,
      this.placeholder,
      this.onChanged});

  _FieldBody2State createState() => _FieldBody2State();
}

class _FieldBody2State extends State<_FieldBody2> {
  final int _maxLines = 3;
  final _typographyStyle = RoofTypography.bodyPrimary;
  final _controller = TextEditingController();

  _FieldBody2State();

  _controllerUpdated() {
    widget.onChanged(_controller.text);
  }

  @override
  void initState() {
    _controller.text = widget.initialValue;
    _controller.addListener(_controllerUpdated);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = RoofTheme.of(context);
    final decoration = InputDecoration(
        hintText: widget.placeholder,
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.color.stroke.light),
            borderRadius: BorderRadius.all(RoofCornerRadius.regular)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.color.stroke.focus),
            borderRadius: BorderRadius.all(RoofCornerRadius.regular)),
        hintStyle:
            _typographyStyle.textStyleWithColor(theme.color.text.placeholder));

    return Container(
        margin: EdgeInsets.fromLTRB(0, RoofDistance.a, 0, 0),
        child: TextField(
            autofocus: widget.autofocus ?? false,
            textInputAction: widget.textInputAction,
            maxLines: _maxLines,
            decoration: decoration,
            controller: _controller));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
