import 'package:flutter/material.dart';
import 'package:form_builder/index.dart';
import 'package:form_vertical_floating_artboard_template/index.dart';
import 'package:vertical_floating_artboard_scaffold/index.dart';
import 'package:meta_form_artboard_builder/index.dart';

class MetaFormVerticalFloatingArtboard<T>
    extends FormVerticalFloatingArtboard<T> with MetaFormArtboardBuilder<T> {
  final Future<List<StreamableFormFieldData>> fieldsData;
  final T Function(List<StreamableFormFieldData>) valueFromFieldsData;
  final String title;
  final String submitButtonText;
  final void Function() validateForm;

  MetaFormVerticalFloatingArtboard({
    @required this.valueFromFieldsData,
    @required this.fieldsData,
    this.title,
    String submitButtonText,
    this.validateForm,
  }) : this.submitButtonText = submitButtonText ?? "Done";

  @override
  submit(BuildContext context) async {
    final newResult = valueFromFieldsData(await fieldsData);
    VerticalFloatingArtboardNavigatorPanel.of(context).completeWith(newResult);
  }

  @override
  Future<List<StreamableFormFieldData>> get initialFieldData => fieldsData;
}
