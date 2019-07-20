import 'package:flutter/material.dart';
import 'package:form/index.dart';
import 'package:form/src/data/_mixins/on_tap_listener_adder.dart';

class FormTagFieldData extends StreamableFormFieldData<List<String>>
    with OnTapListenerAdder {
  List<String> tags;
  String placeholder;

  FormTagFieldData({
    this.tags,
    @required String title,
    @required this.placeholder,
    double size,
    bool isVisible,
  }) : super(
          title: title,
          size: size,
          isVisible: isVisible,
        );
}
