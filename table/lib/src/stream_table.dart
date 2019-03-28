import 'package:flutter/material.dart';
import 'package:stream/index.dart';

import 'bloc.dart';
import 'widget.dart';
import 'data/index.dart';

abstract class StreamTable<
    T extends StreamableTableRowData,
    U extends StreamableTableSectionHeaderData,
    V extends StreamableTableHeaderData> extends StatelessWidget {
  final bloc = StreamTableBloc();

  bool get showsHeaderForEmptyTable => true;
  bool get showsHeadersForEmptySections => false;

  Widget build(BuildContext context) {
    final table = StreamTableBuilder(
      buildRow: buildRow,
      buildSectionHeader: buildSectionHeader,
      buildTableHeader: buildTableHeader,
      showsHeaderForEmptyTable: showsHeaderForEmptyTable,
      showsHeadersForEmptySections: showsHeadersForEmptySections,
    );
    return BlocProvider(
      bloc: bloc,
      child: table,
    );
  }

  Widget buildRow({T rowData, int rowIndex, int sectionIndex}) => null;
  Widget buildSectionHeader({U headerData, int sectionIndex}) => null;
  SliverPersistentHeader buildTableHeader({V headerData}) => null;
}
