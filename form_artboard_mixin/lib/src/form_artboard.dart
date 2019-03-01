import 'package:flutter/material.dart';
import 'package:spec/index.dart';
import 'package:form/index.dart';

import '_roof_stream_form.dart';

mixin FormArtboard {
  List<StreamableFormFieldData> get fieldData => null;
  List<StreamableFormSectionData> get sectionData => null;
  StreamableFormData get formData => null;
  String get address;
  Map<String, Object> get params;
  double get fieldHorizontalSpacing => RoofDistance.c;

  Future<List<StreamableFormFieldData>> get loadedFieldData async {
    return Future<List<StreamableFormFieldData>>.value(null);
  }

  Future<List<StreamableFormSectionData>> get loadedSectionData async {
    return Future<List<StreamableFormSectionData>>.value(null);
  }

  StreamFormBloc get form => _form.bloc;

  final _form = RoofStreamForm();

  RoofStreamForm buildForm(BuildContext context) {
    StreamableFormData formData;
    if (this.formData != null)
      formData = this.formData;
    else if (sectionData != null) {
      formData = StreamableFormData(sectionData: sectionData);
    } else {
      formData = StreamableFormData.withFields(
          fieldData: fieldData, fieldHorizontalSpacing: fieldHorizontalSpacing);
    }

    if (formData != null) {
      form.update(formData);
    }

    form.getAddress = () => address;
    form.getParams = () => params;

    _load();
    return _form;
  }

  _load() async {
    final sectionData = await loadedSectionData;
    if (sectionData != null) {
      return form.batchInsertSectionData(sectionData);
    }

    final fieldData = await loadedFieldData;
    if (fieldData != null) {
      return form.batchInsertFieldData(fieldData);
    }
  }
}
