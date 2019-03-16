import 'package:flutter/material.dart';
import 'package:theme/index.dart';
import 'package:typography/index.dart';
import 'package:spec/index.dart';
import 'package:mask/index.dart';

import 'widgets/index.dart';

class RoofTextField extends StatelessWidget {
  final String fieldName;
  final String placeholder;
  final String initialValue;
  final bool isPassword;
  final bool autofocus;
  final TextInputAction textInputAction;
  final MaskOption mask;
  final Function(String) onChanged;

  RoofTextField(
      {@required this.fieldName,
      this.placeholder,
      this.initialValue,
      this.isPassword = false,
      this.autofocus = false,
      this.mask,
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
        mask: mask,
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
  final MaskOption mask;
  final Function(String) onChanged;

  _FieldBody(
      {this.autofocus,
      this.isPassword,
      this.initialValue,
      this.textInputAction,
      this.mask,
      this.placeholder,
      this.onChanged});

  _FieldBodyState createState() => _FieldBodyState();
}

class _FieldBodyState extends State<_FieldBody> {
  final _controller = TextEditingController();
  final _typographyStyle = RoofTypography.bodyPrimary;

  _FieldBodyState();

  _controllerUpdated() {
    if (widget.mask != null) {
      final formattedText = Mask(widget.mask).apply(_controller.text);

      print("sup $formattedText");
      _controller.removeListener(_controllerUpdated);
      _controller.text = formattedText;
      _controller.addListener(_controllerUpdated);
    }
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
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: theme.color.stroke.light)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: theme.color.stroke.focus)),
        hintStyle:
            _typographyStyle.textStyleWithColor(theme.color.text.placeholder));

    return TextField(
        autofocus: widget.autofocus,
        obscureText: widget.isPassword,
        textInputAction: widget.textInputAction,
        decoration: decoration,
        controller: _controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
