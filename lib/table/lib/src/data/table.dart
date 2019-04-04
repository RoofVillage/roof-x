import 'package:flutter/material.dart';
import 'package:stream/index.dart';

import 'table_header.dart';
import 'section.dart';
import 'row.dart';

import '../util/index.dart';

class StreamableTableData extends StreamableData {
  final StreamableTableHeaderData headerData;
  final Axis scrollDirection;
  final bool reverse;

  //Sections should never be changed or removed.
  final List<StreamableTableSectionData> sectionData;

  List<StreamableTableRowData> get _rowData {
    return sectionData.expand((sectionData) => sectionData.rowData).toList();
  }

  StreamableTableData(
      {this.headerData,
      this.sectionData,
      Axis scrollDirection,
      bool reverse,
      List<StreamableTableRowData> rowData})
      : reverse = reverse ?? false,
        scrollDirection = scrollDirection ?? Axis.vertical {
    _sortWithRowData(rowData);
  }

  StreamableTableData.withoutSections(
      {StreamableTableHeaderData headerData,
      bool reverse,
      Axis scrollDirection,
      List<StreamableTableRowData> rowData})
      : this(
            headerData: headerData,
            sectionData: [
              StreamableTableSectionData(
                  criteria: (_) => true, headerData: null, sort: (_, __) => 0)
            ],
            reverse: reverse,
            scrollDirection: scrollDirection,
            rowData: rowData);

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
    for (var sectionData in sectionData) {
      sectionData.rowData.removeRange(0, sectionData.rowData.length);
    }

    //Add the rows to their correct sections.
    for (var rowData in rowData) {
      for (final sectionData in sectionData) {
        if (!sectionData.acceptsRow(rowData)) continue;
        sectionData.addRowData(rowData);
        break;
      }
    }

    //Sort the sections.
    for (var sectionData in sectionData) {
      sectionData.sortRowData();
    }
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
