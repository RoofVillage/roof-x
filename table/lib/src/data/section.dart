import 'package:collection/collection.dart';

import 'row.dart';
import 'section_header.dart';

class StreamableTableSectionData<S extends StreamableTableRowData>
    extends StreamableTableRowData {
  final StreamableTableSectionHeaderData headerData;

  final rowData = <S>[];

  Function(S, S) sort;
  bool Function(S) criteria;

  StreamableTableSectionData({this.headerData, this.sort, this.criteria});

  StreamableTableSectionData.withTitle(String title,
      {Function(S, S) sort, Function(S) criteria})
      : this(
            headerData: StreamableTableSectionHeaderData(title: title),
            sort: sort,
            criteria: criteria);

  void addRowData(StreamableTableRowData rowData) {
    this.rowData.add(rowData);
  }

  void removeRowDataAtIndex(int index) {
    this.rowData.removeAt(index);
  }

  void replaceIndex(int index, StreamableTableRowData rowData) {
    this.rowData.replaceRange(index, index + 1, [rowData]);
  }

  int indexOfRowData(StreamableTableRowData rowData) {
    final rowIndex = this.rowData.indexWhere((row) => row.key == rowData.key);
    return rowIndex;
  }

  void sortRowData() {
    insertionSort<S>(rowData, compare: sort);
  }

  bool acceptsRow(StreamableTableRowData rowData) {
    return criteria(rowData);
  }
}
