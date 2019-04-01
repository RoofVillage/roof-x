import 'dart:async';

import 'package:flutter/material.dart';
import 'package:table/index.dart';

import 'components/index.dart';

mixin TableBuilder {
  List<StreamableTableRowData> get rowData => null;
  List<StreamableTableSectionData> get sectionData => null;
  StreamableTableData get tableData => null;

  Future<List<StreamableTableRowData>> get loadRowData async {
    return Future<List<StreamableTableRowData>>.value(null);
  }

  StreamTableBloc get table => _table.bloc;

  final _table = RoofStreamTable();

  RoofStreamTable buildTable(BuildContext context) {
    StreamableTableData tableData;
    List<StreamableTableRowData> rowData = this.rowData ?? [];

    if (this.tableData != null)
      tableData = this.tableData;
    else if (this.sectionData != null) {
      tableData =
          StreamableTableData(sectionData: this.sectionData, rowData: rowData);
    } else {
      tableData = StreamableTableData.withoutSections(rowData: rowData);
    }

    if (tableData != null) {
      table.update(tableData);
    }

    _load();
    return _table;
  }

  _load() async {
    final rowData = await loadRowData;

    if (rowData == null) return;

    table.batchInsertRowData(rowData);
  }
}
