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
  final Function(String, BuildContext) onSubmitted;
  final Function(bool) onFocusChanged;
  final FocusNode focusNode;

  RoofTextArea(
      {this.fieldName,
      this.placeholder,
      this.initialValue,
      this.autofocus = false,
      this.textInputAction,
      this.onChanged,
      this.onSubmitted,
      this.onFocusChanged,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    List<Widget> fieldChildren = [];

    if (fieldName != null) {
      fieldChildren.add(RoofFieldLabel(labelText: fieldName));
    }

    fieldChildren.add(_FieldBody(
      autofocus: autofocus,
      initialValue: initialValue,
      placeholder: placeholder,
      textInputAction: textInputAction,
      onChanged: onChanged,
      focusNode: focusNode,
    ));

    return Container(
        margin: RoofObjectPadding.field1,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: fieldChildren));
  }
}

class _FieldBody extends StatefulWidget {
  final bool autofocus;
  final String initialValue;
  final String placeholder;
  final TextInputAction textInputAction;
  final Function(String) onChanged;
  final Function(String, BuildContext) onSubmitted;
  final Function(bool) onFocusChanged;
  final FocusNode focusNode;

  _FieldBody(
      {this.autofocus,
      this.initialValue,
      this.textInputAction,
      this.placeholder,
      this.onChanged,
      this.onSubmitted,
      this.onFocusChanged,
      this.focusNode});

  _FieldBodyState createState() => _FieldBodyState();
}

class _FieldBodyState extends State<_FieldBody> {
  final int _maxLines = 3;
  final _typographyStyle = RoofTypography.bodyPrimary;
  final _controller = TextEditingController();

  _controllerUpdated() {
    widget.onChanged(_controller.text);
  }

  @override
  void initState() {
    _controller.text = widget.initialValue;
    _controller.addListener(_controllerUpdated);
    widget.focusNode.addListener(focusUpdated);
    super.initState();
  }

  void focusUpdated() {
    widget.onFocusChanged(widget.focusNode.hasFocus);
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
            autofocus: widget.autofocus,
            textInputAction: widget.textInputAction,
            maxLines: _maxLines,
            decoration: decoration,
            onSubmitted: (value) => widget.onSubmitted(value, context),
            focusNode: widget.focusNode,
            controller: _controller));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
