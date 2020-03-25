import 'package:flutter/material.dart';
import 'package:form_body_builder/src/_components/fields/_picker_field.dart';
import 'package:labeled_value/index.dart';
import 'package:semantic_theme/index.dart';
import 'package:tag_builder/index.dart';

class MetaFormField extends StatelessWidget with TagBuilder {
  final String title;
  final List<LabeledValue<String>> labeledValues;
  final VoidCallback onTap;

  MetaFormField({
    this.title,
    this.labeledValues,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: WIP
    Widget fieldBody = Text(labeledValues?.first?.value ?? 'nothin');

    return PickerField(
      name: title,
      onTap: onTap,
      fieldBody: fieldBody,
    );
  }
}
