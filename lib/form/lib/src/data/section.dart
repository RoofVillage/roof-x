import 'package:flutter/material.dart';
import 'package:stream/index.dart';

import 'field.dart';
import 'section_header.dart';

class StreamableFormSectionData extends StreamableData {
  final double fieldHorizontalSpacing;
  StreamableFormSectionHeaderData headerData;

  final List<StreamableFormFieldData> fieldData;

  StreamableFormSectionData(
      {this.headerData, this.fieldData, this.fieldHorizontalSpacing});

  void replace({@required int index, StreamableFormFieldData fieldData}) {
    this.fieldData.replaceRange(index, index + 1, [fieldData]);
  }

  void addFieldData({@required StreamableFormFieldData fieldData, int index}) {
    this.fieldData.insert(index, fieldData);
  }

  void batchAddFieldData(
      {@required List<StreamableFormFieldData> fieldData, int index}) {
    this.fieldData.insertAll(index, fieldData);
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
