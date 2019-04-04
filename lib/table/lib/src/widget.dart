import 'package:flutter/material.dart';
import 'package:stream/index.dart';

import 'bloc.dart';
import 'data/index.dart';

class StreamTableBuilder<T extends StreamTableBloc> extends StatelessWidget {
  final _RowBuilder buildRow;

  final _TableHeaderBuilder buildTableHeader;

  final _TableSectionHeaderBuilder buildSectionHeader;

  final bool showsHeaderForEmptyTable;
  final bool showsHeadersForEmptySections;

  Widget get _emptyHeader => Container();

  StreamTableBuilder(
      {Key key,
      @required this.buildRow,
      this.buildSectionHeader,
      this.buildTableHeader,
      this.showsHeaderForEmptyTable = true,
      this.showsHeadersForEmptySections = false})
      : super(key: key);

  Widget build(BuildContext context) {
    final T tableBloc = BlocProvider.of<T>(context);
    return StreamBuilder<StreamableTableData>(
        stream: tableBloc.outTable,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container();

          return _createTable(context: context, tableData: snapshot.data);
        });
  }

  Widget _createTable(
      {@required BuildContext context,
      @required StreamableTableData tableData}) {
    final slivers = <Widget>[];

    final shouldShowHeader = tableData.headerData != null &&
        (tableData.sectionData.isNotEmpty || showsHeaderForEmptyTable) &&
        buildTableHeader != null;

    //Add the table header if needed.
    if (shouldShowHeader) {
      final header = buildTableHeader(headerData: tableData.headerData);
      if (header != null) slivers.add(header);
    }

    final delegate = _sliverListDelegateForTableData(tableData);
    final sliverList = SliverList(delegate: delegate);

    slivers.add(sliverList);

    final table = CustomScrollView(
        scrollDirection: tableData.scrollDirection,
        reverse: tableData.reverse,
        slivers: slivers,
        key: PageStorageKey(tableData.key));

    return table;
  }

  SliverChildBuilderDelegate _sliverListDelegateForTableData(
      StreamableTableData tableData) {
    final childData = _sliverListChildDataForTableData(tableData);

    final delegate = SliverChildBuilderDelegate((context, index) {
      final data = childData[index];
      return Container(key: data.key, child: _child(data));
    }, childCount: childData.length);

    return delegate;
  }

  Widget _child(_SliverListChildData data) {
    switch (data.type) {
      case _SliverListChildDataType.header:
        return _createSectionHeader(
            sectionData: data.sectionData, sectionIndex: data.sectionIndex);
      case _SliverListChildDataType.row:
        return buildRow(
            rowData: data.rowData,
            rowIndex: data.rowIndex,
            sectionIndex: data.sectionIndex);
    }
    return null;
  }

  List<_SliverListChildData> _sliverListChildDataForTableData(
      StreamableTableData tableData) {
    final childData = <_SliverListChildData>[];

    //Add each sections that accept streamable updates.
    for (var i = 0; i < tableData.sectionData.length; i++) {
      final sectionData = tableData.sectionData[i];

      final sectionHeaderRowData = _SliverListChildData.forHeader(
          key: sectionData.key, sectionData: sectionData, sectionIndex: i);

      childData.add(sectionHeaderRowData);

      final sectionRows =
          _rowDataForSectionData(sectionData: sectionData, sectionIndex: i);
      childData.addAll(sectionRows);
    }

    return childData;
  }

  List<_SliverListChildData> _rowDataForSectionData(
      {@required StreamableTableSectionData sectionData,
      @required int sectionIndex}) {
    final childData = <_SliverListChildData>[];
    for (var i = 0; i < sectionData.rowData.length; i++) {
      final rowData = sectionData.rowData[i];
      final data = _SliverListChildData.forRow(
          key: rowData.key,
          rowData: rowData,
          rowIndex: i,
          sectionIndex: sectionIndex);
      childData.add(data);
    }
    return childData;
  }

  Widget _createSectionHeader(
      {@required StreamableTableSectionData sectionData,
      @required int sectionIndex}) {
    //Add the header if needed. If the section changes, check to make sure a header is still needed.
    final shouldShowSectionHeader = sectionData.headerData != null &&
        (sectionData.rowData.isNotEmpty || showsHeadersForEmptySections) &&
        buildSectionHeader != null;

    if (!shouldShowSectionHeader) return _emptyHeader;

    return buildSectionHeader(
            headerData: sectionData.headerData, sectionIndex: sectionIndex) ??
        _emptyHeader;
  }
}

typedef _RowBuilder = Widget Function(
    {@required StreamableTableRowData rowData, int rowIndex, int sectionIndex});

typedef _TableHeaderBuilder = SliverPersistentHeader Function(
    {@required StreamableTableHeaderData headerData});

typedef _TableSectionHeaderBuilder = Widget Function(
    {@required StreamableTableSectionHeaderData headerData, int sectionIndex});

enum _SliverListChildDataType { header, row }

class _SliverListChildData {
  final StreamableTableRowData rowData;
  final StreamableTableSectionData sectionData;
  final int rowIndex;
  final int sectionIndex;
  final _SliverListChildDataType type;
  final Key key;

  _SliverListChildData(
      {this.key,
      this.rowData,
      this.sectionData,
      this.rowIndex,
      this.sectionIndex,
      this.type});

  _SliverListChildData.forRow(
      {@required StreamableTableRowData rowData,
      @required int rowIndex,
      @required String key,
      @required int sectionIndex})
      : this(
            key: ValueKey(key),
            rowData: rowData,
            rowIndex: rowIndex,
            sectionIndex: sectionIndex,
            type: _SliverListChildDataType.row);

  _SliverListChildData.forHeader(
      {@required StreamableTableSectionData sectionData,
      @required String key,
      @required int sectionIndex})
      : this(
            key: ValueKey(key),
            sectionData: sectionData,
            sectionIndex: sectionIndex,
            type: _SliverListChildDataType.header);
}
