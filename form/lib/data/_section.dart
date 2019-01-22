import 'package:flutter/material.dart';
import 'package:stream/streamable_data.dart';

import './_field.dart';
import './_section_header.dart';

class StreamableFormSectionData extends StreamableData {
  StreamableFormSectionHeaderData headerData;

  final List<StreamableData> fieldData = [];

  void replace({@required int index, StreamableData fieldData}) {
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
