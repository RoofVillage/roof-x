import 'package:flutter/material.dart';
import 'package:stream/streamable_data.dart';

import './_table_header.dart';
import './_section.dart';
import './_row.dart';

import './../util/index.dart';

class StreamableTableData extends StreamableData {
  final StreamableTableHeaderData headerData;
  final Axis scrollDirection;
  final bool reverse;

  //Sections should never be changed or removed.
  final List<StreamableTableSectionData> sectionData;

  List<StreamableTableRowData> get _rowData {
    return sectionData.expand((sectionData) => sectionData.rowData);
  }

  StreamableTableData(
      {this.headerData,
      this.sectionData,
      this.reverse = false,
      this.scrollDirection = Axis.vertical,
      rowData}) {
    _sortWithRowData(rowData);
  }

  void replaceTableLocation(
      TableLocation location, StreamableTableRowData rowData) {
    final sectionData = this.sectionData[location.sectionIndex];
    sectionData.replaceIndex(location.rowIndex, rowData);
  }

  void addRowData(StreamableTableRowData rowData, int index) {
    if (index < 0 || index >= this.sectionData.length) return;

    final sectionData = this.sectionData[index];
    sectionData.addRowData(rowData);
  }

  void removeAtTableLocation(TableLocation location) {
    final sectionData = this.sectionData[location.sectionIndex];
    sectionData.removeRowDataAtIndex(location.rowIndex);
  }

  StreamableTableRowData rowDataAt(TableLocation location) {
    final sectionData = this.sectionData[location.sectionIndex];
    final rowData = sectionData.rowData[location.rowIndex];
    return rowData;
  }

  void sort() {
    _sortWithRowData(_rowData);
  }

  void _sortWithRowData(List<StreamableTableRowData> rowData) {
    //Empty all sections.
    sectionData.forEach((sectionData) =>
        sectionData.rowData.removeRange(0, sectionData.rowData.length));

    //Add the rows to their correct sections.
    rowData.forEach((rowData) {
      for (final sectionData in sectionData) {
        if (!sectionData.acceptsRow(rowData)) continue;
        sectionData.addRowData(rowData);
        return;
      }
    });

    //Sort the sections.
    sectionData.forEach((sectionData) => sectionData.sortRowData());
  }

  TableLocation tableLocationOfRowData(StreamableTableRowData rowData) {
    for (int i = 0; i < sectionData.length; i++) {
      final sectionData = this.sectionData[i];
      final rowIndex = sectionData.indexOfRowData(rowData);
      if (rowIndex < 0) continue;

      return TableLocation(rowIndex: rowIndex, sectionIndex: i);
    }
    return null;
  }
}
