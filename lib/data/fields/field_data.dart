import 'package:flutter/material.dart';

class FieldData {
  final String name;
  final String placeholder;
  final String initialValue;
  bool autofocus;
  final TextInputType keyboardType;

  FieldData(
      {this.name,
      this.placeholder,
      this.initialValue,
      this.autofocus = false,
      this.keyboardType});
}
