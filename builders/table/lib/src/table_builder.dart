import 'dart:async';

import 'package:flutter/material.dart';
import 'package:table/index.dart';

import '_components/standard_stream_table.dart';

mixin TableBuilder {
  Future<List<StreamableTableRowData>> get rowData => null;
  Future<List<StreamableTableSectionData>> get sectionData => null;
  Future<StreamableTableData> get tableData => null;

  StreamTableBloc get table => _table.bloc;

  final _table = StandardStreamTable();

  StandardStreamTable buildTable(BuildContext context) {
    _load(context);
    return _table;
  }

  void _load(BuildContext context) async {
    final tableData = await _createTableData(context);
    if (tableData == null) return;
    table.update(tableData);
  }

  Future<StreamableTableData> _createTableData(BuildContext context) async {
    final tableData = await this.tableData;
    if (tableData != null) return tableData;

    final sectionData = await this.sectionData;
    final rowData = await this.rowData;
    if (sectionData.isNotEmpty) {
      return StreamableTableData(sectionData: sectionData, rowData: rowData);
    }
    return StreamableTableData.withoutSections(rowData: rowData);
  }
}
