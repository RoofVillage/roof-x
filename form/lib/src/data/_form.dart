import 'package:flutter/material.dart';
import 'package:stream/index.dart';

import '_section.dart';
import '_field.dart';

import '../util/index.dart';

class StreamableFormData extends StreamableData {
  final List<StreamableFormSectionData> sectionData;

  List<StreamableFormFieldData> get fieldData {
    return sectionData.expand((sectionData) => sectionData.fieldData);
  }

  StreamableFormData({this.sectionData});

  StreamableFormData.withFields({List<StreamableFormFieldData> fieldData})
      : sectionData = [StreamableFormSectionData(fieldData: fieldData)];

  void updateField(StreamableFormFieldData fieldData) {
    final formLocation = formLocationOfFieldData(fieldData);
    final sectionData = this.sectionData[formLocation.sectionIndex];
    sectionData.replace(index: formLocation.fieldIndex, fieldData: fieldData);
  }

  void updateSection(StreamableFormSectionData sectionData) {
    final sectionIndex = this.sectionData.indexOf(sectionData);
    _replace(index: sectionIndex, sectionData: sectionData);
  }

  void addFieldDataAfter(StreamableFormFieldData fieldData,
      StreamableFormFieldData afterFieldData) {
    final afterFieldDataFormLocation = formLocationOfFieldData(afterFieldData);
    final sectionData =
        this.sectionData[afterFieldDataFormLocation.sectionIndex];
    sectionData.addFieldData(
        fieldData: fieldData, index: afterFieldDataFormLocation.fieldIndex + 1);
  }

  void addFieldDataBefore(StreamableFormFieldData fieldData,
      StreamableFormFieldData beforeFieldData) {
    final beforeFieldDataFormLocation =
        formLocationOfFieldData(beforeFieldData);
    if (beforeFieldDataFormLocation.fieldIndex < 0) return;
    final sectionData =
        this.sectionData[beforeFieldDataFormLocation.sectionIndex];
    sectionData.addFieldData(
        fieldData: fieldData, index: beforeFieldDataFormLocation.fieldIndex);
  }

  void removeAtFormLocation(FormLocation location) {
    final sectionData = this.sectionData[location.sectionIndex];
    sectionData.removeFieldDataAtIndex(location.fieldIndex);
  }

  FormLocation formLocationOfFieldData(StreamableFormFieldData fieldData) {
    for (int i = 0; i < sectionData.length; i++) {
      final sectionData = this.sectionData[i];
      final fieldIndex = sectionData.indexOfFieldData(fieldData);
      if (fieldIndex < 0) continue;

      return FormLocation(fieldIndex: fieldIndex, sectionIndex: i);
    }
    return null;
  }

  void _replace({@required int index, StreamableFormSectionData sectionData}) {
    this.sectionData.replaceRange(index, index + 1, [sectionData]);
  }
}
