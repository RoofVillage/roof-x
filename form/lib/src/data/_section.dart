import 'package:flutter/material.dart';
import 'package:stream/index.dart';

import '_field.dart';
import '_section_header.dart';

class StreamableFormSectionData extends StreamableData {
  final double fieldHorizontalSpacing;
  StreamableFormSectionHeaderData headerData;

  final List<StreamableFormFieldData> fieldData;

  StreamableFormSectionData(
      {this.headerData, this.fieldData, double fieldHorizontalSpacing})
      : fieldHorizontalSpacing = fieldHorizontalSpacing ?? 0;

  void replace({@required int index, StreamableFormFieldData fieldData}) {
    this.fieldData.replaceRange(index, index + 1, [fieldData]);
  }

  void addFieldData({@required StreamableFormFieldData fieldData, int index}) {
    this.fieldData.insert(index, fieldData);
  }

  void removeFieldDataAtIndex(int index) {
    this.fieldData.removeAt(index);
  }

  int indexOfFieldData(StreamableFormFieldData fieldData) {
    final dataIndex =
        this.fieldData.indexWhere((row) => row.key == fieldData.key);
    return dataIndex;
  }
}
