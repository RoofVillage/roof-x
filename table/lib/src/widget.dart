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

          return _createTable(
              bloc: tableBloc, context: context, tableData: snapshot.data);
        });
  }

  Widget _createTable(
      {@required T bloc,
      @required BuildContext context,
      @required StreamableTableData tableData}) {
    final List<Widget> slivers = [SliverToBoxAdapter()];

    final shouldShowHeader = tableData.headerData != null &&
        (tableData.sectionData.isNotEmpty || showsHeaderForEmptyTable) &&
        buildTableHeader != null;

    //Add the table header if needed.
    if (shouldShowHeader) {
      final header = buildTableHeader(headerData: tableData.headerData);
      if (header != null) slivers.add(header);
    }

    //Add each sections that accept streamable updates.
    tableData.sectionData
      ..asMap().forEach((index, sectionData) {
        //The steam to which section updates will be posted.
        final outSectionStream =
            bloc.outSection.where((data) => data.key == sectionData.key);

        final sectionHeader = _createSectionHeader(
            outSectionStream: outSectionStream,
            sectionData: sectionData,
            sectionIndex: index);

        slivers.add(sectionHeader);

        final section = _createSection(
            bloc: bloc,
            outSectionStream: outSectionStream,
            sectionData: sectionData,
            sectionIndex: index);

        slivers.add(section);
      });

    final table = CustomScrollView(
        scrollDirection: tableData.scrollDirection,
        reverse: tableData.reverse,
        slivers: slivers);

    return table;
  }

  Widget _createSectionHeader(
      {@required Stream outSectionStream,
      @required StreamableTableSectionData sectionData,
      @required int sectionIndex}) {
    //Add the header if needed. If the section changes, check to make sure a header is still needed.
    final sectionHeader = StreamBuilder<StreamableTableSectionData>(
        stream: outSectionStream,
        initialData: sectionData,
        builder: (context, snapshot) {
          final shouldShowSectionHeader = sectionData.headerData != null &&
              (sectionData.rowData.isNotEmpty ||
                  showsHeadersForEmptySections) &&
              buildSectionHeader != null;

          if (!snapshot.hasData || !shouldShowSectionHeader) return _empty();

          final header = buildSectionHeader(
              headerData: sectionData.headerData, sectionIndex: sectionIndex);

          if (header == null) return _empty();

          return header;
        });
    return sectionHeader;
  }

  Widget _createSection(
      {@required T bloc,
      @required Stream outSectionStream,
      @required StreamableTableSectionData sectionData,
      @required int sectionIndex}) {
    final section = StreamBuilder<StreamableTableSectionData>(
        stream: outSectionStream,
        initialData: sectionData,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return SliverToBoxAdapter();

          final section = _createSectionSliver(
              bloc: bloc,
              sectionData: snapshot.data,
              sectionIndex: sectionIndex);

          return section;
        });

    return section;
  }

  Widget _createSectionSliver(
      {@required T bloc,
      @required StreamableTableSectionData sectionData,
      @required int sectionIndex}) {
    final delegate =
        SliverChildBuilderDelegate((BuildContext context, int index) {
      final initialRowData = sectionData.rowData[index];

      final outRowStream =
          bloc.outRow.where((data) => data.key == initialRowData.key);

      final row = _createRow(
          outRowStream: outRowStream,
          rowData: initialRowData,
          rowIndex: index,
          sectionIndex: sectionIndex);

      return row;
    }, childCount: sectionData.rowData.length);

    final sectionSliver = SliverList(delegate: delegate);

    return sectionSliver;
  }

  Widget _createRow(
      {@required Stream outRowStream,
      @required StreamableTableRowData rowData,
      @required int rowIndex,
      @required int sectionIndex}) {
    return StreamBuilder<StreamableTableRowData>(
        stream: outRowStream,
        initialData: rowData,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return SliverToBoxAdapter();
          final row = buildRow(
              rowData: snapshot.data,
              rowIndex: rowIndex,
              sectionIndex: sectionIndex);

          if (row == null) return _empty();

          return row;
        });
  }

  Widget _empty() => SliverToBoxAdapter();
}

typedef _RowBuilder = Widget Function(
    {@required StreamableTableRowData rowData, int rowIndex, int sectionIndex});

typedef _TableHeaderBuilder = SliverPersistentHeader Function(
    {@required StreamableTableHeaderData headerData});

typedef _TableSectionHeaderBuilder = SliverPersistentHeader Function(
    {@required StreamableTableSectionHeaderData headerData, int sectionIndex});
