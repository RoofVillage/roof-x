import 'package:flutter/material.dart';

import 'package:roofui_kit/stream/roofui_bloc_provider.dart';
import 'package:roofui_kit/stream/roofui_table_bloc.dart';
import 'package:roofui_kit/stream/roofui_streamable_data.dart';

typedef RowBuilder = Widget Function(
    {@required RoofUIStreamableData rowData, int rowIndex, int sectionIndex});

typedef TableHeaderBuilder = Widget Function(
    {@required RoofUIStreamableTableHeaderData headerData});

typedef SectionHeaderBuilder = Widget Function(
    {@required RoofUIStreamableSectionHeaderData headerData, int sectionIndex});

class RoofUITable<T extends RoofUITableBloc> extends StatelessWidget {
  final RowBuilder buildRow;

  final TableHeaderBuilder buildTableHeader;

  final SectionHeaderBuilder buildSectionHeader;

  final bool showsHeaderForEmptyTable;
  final bool showsHeadersForEmptySections;

  RoofUITable(
      {Key key,
      @required this.buildRow,
      this.buildSectionHeader,
      this.buildTableHeader,
      this.showsHeaderForEmptyTable = true,
      this.showsHeadersForEmptySections = false})
      : super(key: key);

  Widget build(BuildContext context) {
    final T tableBloc = RoofUIBlocProvider.of<T>(context);
    return StreamBuilder<RoofUIStreamableTableData>(
        stream: tableBloc.outTable,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Container(child: Text("Moo"));

          return _tableList(
              bloc: tableBloc, context: context, tableData: snapshot.data);
        });
  }

  Widget _tableList(
      {@required T bloc,
      @required BuildContext context,
      @required RoofUIStreamableTableData tableData}) {
    final shouldShowHeader = tableData.headerData != null &&
        (tableData.sectionData.isNotEmpty || showsHeaderForEmptyTable) &&
        buildTableHeader != null;
    final itemCountHeaderIncrement = shouldShowHeader ? 1 : 0;

    final tableBuilder = ListView.builder(
      itemCount: tableData.sectionData.length + itemCountHeaderIncrement,
      itemBuilder: (BuildContext context, int index) {
        if (shouldShowHeader) {
          if (index == 0) {
            return buildTableHeader(headerData: tableData.headerData);
          } else {
            index -= 1;
          }
        }

        final initialSectionData = tableData.sectionData[index];
        return StreamBuilder<RoofUIStreamableData>(
            stream: bloc.outSection
                .where((data) => data.id == initialSectionData.id),
            initialData: initialSectionData,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Container(child: Text("Doo"));
              return _sectionList(
                  bloc: bloc,
                  context: context,
                  sectionData: snapshot.data,
                  sectionIndex: index);
            });
      },
    );

    return tableBuilder;
  }

  Widget _sectionList(
      {@required T bloc,
      @required BuildContext context,
      @required RoofUIStreamableSectionData sectionData,
      @required int sectionIndex}) {
    final shouldShowHeader = sectionData.headerData != null &&
        (sectionData.rowData.isNotEmpty || showsHeaderForEmptyTable) &&
        buildSectionHeader != null;

    final itemCountHeaderIncrement = shouldShowHeader ? 1 : 0;

    final sectionList = ListView.builder(
      itemCount: sectionData.rowData.length + itemCountHeaderIncrement,
      itemBuilder: (BuildContext context, int index) {
        if (shouldShowHeader) {
          if (index == 0) {
            return buildSectionHeader(
                headerData: sectionData.headerData, sectionIndex: sectionIndex);
          } else {
            index -= 1;
          }
        }

        final initialRowData = sectionData.rowData[index];

        return StreamBuilder<RoofUIStreamableData>(
            stream: bloc.outRow.where((data) => data.id == initialRowData.id),
            initialData: initialRowData,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Container(child: Text("Goo"));
              return buildRow(
                  rowData: snapshot.data,
                  rowIndex: index,
                  sectionIndex: sectionIndex);
            });
      },
    );

    return sectionList;
  }
}
