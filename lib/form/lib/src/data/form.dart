import 'package:flutter/material.dart';
import 'package:form/index.dart';
import 'package:stream/index.dart';

import 'section.dart';
import 'field.dart';

import '_utils/location.dart';

class StreamableFormData extends StreamableData {
  final List<StreamableFormSectionData> sectionData;
  final Widget submitKeyboardAccessory;
  final double sectionVerticalSpacing;
  final double fieldVerticalSpacing;
  final double fieldHorizontalSpacing;
  final canSubmitWithKeyboardRaised;

  List<StreamableFormFieldData> get fieldData => sectionData
      .expand(
        (sectionData) => sectionData.fieldData,
      )
      .toList();

  StreamableFormData({
    this.sectionData,
    this.fieldHorizontalSpacing,
    this.fieldVerticalSpacing,
    this.submitKeyboardAccessory,
    this.sectionVerticalSpacing,
    this.canSubmitWithKeyboardRaised,
  });

  StreamableFormData.withFields({
    List<StreamableFormFieldData> fieldData,
    this.fieldHorizontalSpacing,
    this.fieldVerticalSpacing,
    this.sectionVerticalSpacing,
    this.canSubmitWithKeyboardRaised,
    this.submitKeyboardAccessory,
  }) : sectionData = [
          StreamableFormSectionData(
            fieldData: fieldData ?? [],
          )
        ];

  void updateFieldData(StreamableFormFieldData fieldData) {
    final formLocation = formLocationOfFieldData(fieldData);
    final sectionData = this.sectionData[formLocation.sectionIndex];
    sectionData.replace(
      index: formLocation.fieldIndex,
      fieldData: fieldData,
    );
  }

  void batchUpdateFieldData(List<StreamableFormFieldData> fieldData) {
    for (final data in fieldData) updateFieldData(data);
  }

  void updateSectionData(StreamableFormSectionData sectionData) {
    final sectionIndex = this.sectionData.indexOf(sectionData);
    _replace(
      index: sectionIndex,
      sectionData: sectionData,
    );
  }

  void addFieldData(StreamableFormFieldData fieldData) {
    final beginning = FormLocation(fieldIndex: 0, sectionIndex: 0);
    _addFieldDataAt(fieldData, beginning);
  }

  void batchAddFieldData(List<StreamableFormFieldData> fieldData) {
    final beginning = FormLocation(fieldIndex: 0, sectionIndex: 0);
    _batchAddFieldDataAt(fieldData, beginning);
  }

  void addFieldDataBefore(
    StreamableFormFieldData fieldData,
    StreamableFormFieldData beforeFieldData,
  ) {
    final beforeFieldDataFormLocation =
        formLocationOfFieldData(beforeFieldData);
    _addFieldDataAt(
      fieldData,
      beforeFieldDataFormLocation,
    );
  }

  void batchAddFieldDataBefore(
    List<StreamableFormFieldData> fieldData,
    StreamableFormFieldData beforeFieldData,
  ) {
    final beforeFieldDataFormLocation =
        formLocationOfFieldData(beforeFieldData);
    if (beforeFieldDataFormLocation.fieldIndex < 0) return;
    final sectionData =
        this.sectionData[beforeFieldDataFormLocation.sectionIndex];
    sectionData.batchAddFieldData(
      fieldData: fieldData,
      index: beforeFieldDataFormLocation.fieldIndex,
    );
  }

  void addFieldDataAfter(
    StreamableFormFieldData fieldData,
    StreamableFormFieldData afterFieldData,
  ) {
    final afterFieldDataFormLocation = formLocationOfFieldData(afterFieldData);
    final insertFormLocation = FormLocation(
      sectionIndex: afterFieldDataFormLocation.sectionIndex,
      fieldIndex: afterFieldDataFormLocation.fieldIndex + 1,
    );

    _addFieldDataAt(fieldData, insertFormLocation);
  }

  void batchAddFieldDataAfter(List<StreamableFormFieldData> fieldData,
      StreamableFormFieldData afterFieldData) {
    final afterFieldDataFormLocation = formLocationOfFieldData(afterFieldData);
    final insertFormLocation = FormLocation(
      sectionIndex: afterFieldDataFormLocation.sectionIndex,
      fieldIndex: afterFieldDataFormLocation.fieldIndex + 1,
    );

    _batchAddFieldDataAt(fieldData, insertFormLocation);
  }

  void addSectionData(
    StreamableFormSectionData sectionData, {
    int index,
  }) {
    final last = this.sectionData.length;
    _addSectionDataAt(sectionData, index ?? last);
  }

  void batchAddSectionData(
    List<StreamableFormSectionData> sectionData, {
    int index,
  }) {
    final last = this.sectionData.length;
    _batchAddSectionDataAt(sectionData, index ?? last);
  }

  void addSectionDataBefore(
    StreamableFormSectionData sectionData,
    StreamableFormSectionData beforeSectionData,
  ) {
    final index = this.sectionData.indexOf(beforeSectionData);
    _addSectionDataAt(sectionData, index);
  }

  void batchAddSectionDataBefore(
    List<StreamableFormSectionData> sectionData,
    StreamableFormSectionData beforeSectionData,
  ) {
    final index = this.sectionData.indexOf(beforeSectionData);
    _batchAddSectionDataAt(sectionData, index);
  }

  void addSectionDataAfter(
    StreamableFormSectionData sectionData,
    StreamableFormSectionData afterSectionData,
  ) {
    final index = this.sectionData.indexOf(afterSectionData);
    _addSectionDataAt(sectionData, index + 1);
  }

  void batchAddSectionDataAfter(
    List<StreamableFormSectionData> sectionData,
    StreamableFormSectionData afterSectionData,
  ) {
    final index = this.sectionData.indexOf(afterSectionData);
    _batchAddSectionDataAt(sectionData, index + 1);
  }

  void removeFieldData(StreamableFormFieldData fieldData) {
    //Get the location of the field being removed
    final location = formLocationOfFieldData(fieldData);

    //If the location cant be found, exit gracefully;
    if (location == null) return;
    final sectionData = this.sectionData[location.sectionIndex];
    sectionData.removeFieldDataAtIndex(location.fieldIndex);
  }

  void removeSectionData(StreamableFormSectionData sectionData) {
    final index = this.sectionData.indexOf(sectionData);
    this.sectionData.removeAt(index);
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

  void _replace({
    @required int index,
    StreamableFormSectionData sectionData,
  }) {
    this.sectionData.replaceRange(
      index,
      index + 1,
      [sectionData],
    );
  }

  void _addFieldDataAt(
    StreamableFormFieldData fieldData,
    FormLocation formLocation,
  ) {
    if (formLocation.fieldIndex < 0) return;
    final sectionData = this.sectionData[formLocation.sectionIndex];
    sectionData.addFieldData(
      fieldData: fieldData,
      index: formLocation.fieldIndex,
    );
  }

  void _batchAddFieldDataAt(
    List<StreamableFormFieldData> fieldData,
    FormLocation formLocation,
  ) {
    if (formLocation.fieldIndex < 0) return;
    final sectionData = this.sectionData[formLocation.sectionIndex];
    sectionData.batchAddFieldData(
      fieldData: fieldData,
      index: formLocation.fieldIndex,
    );
  }

  void _addSectionDataAt(
    StreamableFormSectionData sectionData,
    int index,
  ) {
    if (index < 0) return;
    this.sectionData.insert(index, sectionData);
  }

  void _batchAddSectionDataAt(
    List<StreamableFormSectionData> sectionData,
    int index,
  ) {
    if (index < 0) return;
    this.sectionData.insertAll(index, sectionData);
  }
}
