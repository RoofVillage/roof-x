import 'package:flutter/material.dart';
import 'package:table/index.dart';
import 'package:table_components/index.dart';

import 'data/index.dart';

class RoofStreamTable extends StreamTable<StreamableTableRowData,
    StreamableTableSectionHeaderData, StreamableTableHeaderData> {
  Widget buildCellA({CellAData rowData, int rowIndex, int sectionIndex}) {
    return RoofCellA(
        titleText: rowData.title,
        detailText: "" + (rowData.description ?? ""),
        iconReference: rowData.iconReference);
  }

  @override
  Widget buildRow(
      {BuildContext context,
      StreamableTableRowData rowData,
      int rowIndex,
      int sectionIndex}) {
    if (rowData is CellAData) {
      return buildCellA(
          rowData: rowData, rowIndex: rowIndex, sectionIndex: sectionIndex);
    }

    return null;
  }

  SliverPersistentHeader buildSectionHeader(
      {StreamableTableSectionHeaderData headerData, int sectionIndex}) {
    return SliverPersistentHeader(
        pinned: headerData.pinned,
        floating: headerData.floating,
        delegate: RoofTableSectionHeaderADelegate(title: headerData.title));
  }
}
