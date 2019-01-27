import 'package:flutter/material.dart';
import 'package:stream/index.dart';
import 'bloc.dart';
import 'widget.dart';
import 'data/index.dart';

export 'package:stream/index.dart';
export 'data/index.dart';
export 'bloc.dart';

abstract class StreamTable<
    T extends StreamableTableRowData,
    U extends StreamableTableSectionHeaderData,
    V extends StreamableTableHeaderData> extends StatelessWidget {
  Future<StreamableTableData> get initialTableData => null;

  //If passed in, this is override initialTableData;
  StreamTableBloc get bloc => null;

  bool get showsHeaderForEmptyTable => false;
  bool get showsHeadersForEmptySections => true;

  Widget build(BuildContext context) {
    final bloc = this.bloc ?? StreamTableBloc.withInitialData(initialTableData);
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
  SliverPersistentHeader buildSectionHeader({U headerData, int sectionIndex}) =>
      null;
  SliverPersistentHeader buildTableHeader({V headerData}) => null;
}
