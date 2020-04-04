import 'package:flutter/material.dart';
import 'package:form/index.dart';
import 'package:stream/index.dart';

import 'field.dart';
import 'section_header.dart';

class StreamableFormSectionData extends StreamableData {
  final StreamableFormSectionHeaderData headerData;

  final List<StreamableFormFieldData> fieldData;
  final StreamableFormSectionButtonData buttonData;

  StreamableFormSectionData({
    this.headerData,
    this.fieldData,
    this.buttonData,
  });

  void replace({
    @required int index,
    StreamableFormFieldData fieldData,
  }) {
    final currentFieldDataAtIndex = this.fieldData[index];

    if (currentFieldDataAtIndex == null) return;

    currentFieldDataAtIndex.isVisible = false;

    addFieldData(fieldData: fieldData, index: index);
  }

  void addFieldData({
    @required StreamableFormFieldData fieldData,
    int index,
  }) {
    if (this.fieldData.contains(fieldData)) {
      fieldData.isVisible = true;
    } else {
      this.fieldData.insert(index, fieldData);
    }
  }

  void batchAddFieldData({
    @required List<StreamableFormFieldData> fieldData,
    int index,
  }) {
    List<StreamableFormFieldData> fieldsToInsert = [];
    for (final data in fieldData) {
      if (this.fieldData.contains(data)) {
        data.isVisible = true;
      } else {
        fieldsToInsert.add(data);
      }
    }
    this.fieldData.insertAll(index, fieldsToInsert);
  }

  void removeFieldDataAtIndex(int index) {
    fieldData[index].isVisible = false;
    this.fieldData.removeAt(index);
  }

  int indexOfFieldData(StreamableFormFieldData fieldData) {
    final dataIndex = this.fieldData.indexWhere(
          (row) => row.key == fieldData.key,
        );
    return dataIndex;
  }
}
