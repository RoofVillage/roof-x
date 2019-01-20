import 'package:uuid/uuid.dart';
import 'package:collection/collection.dart';

abstract class RoofUIStreamableData {
  final String _uuid = Uuid().v4();
  final String _customId;

  bool hidden;

  String get id => _customId ?? _uuid;

  RoofUIStreamableData({String id, bool hidden = false})
      : _customId = id,
        hidden = hidden;
}

class RoofUIStreamableSectionData<S extends RoofUIStreamableData>
    extends RoofUIStreamableData {
  RoofUIStreamableSectionHeaderData headerData;

  final List<S> rowData = [];

  Function(S, S) compare;
  bool Function(S) criteria;

  RoofUIStreamableSectionData({this.headerData, this.compare, this.criteria});

  void addRowData(S rowData) {
    this.rowData.add(rowData);
  }

  void removeRowData(S rowData) {
    this.rowData.removeWhere((data) => data.id == rowData.id);
  }

  void removeRowDataAtIndex(int index) {
    this.rowData.removeAt(index);
  }

  void replaceIndex(int index, S rowData) {
    this.rowData.replaceRange(index, index + 1, [rowData]);
  }

  int indexOfRowData(S rowData) {
    final dataIndex = this.rowData.indexWhere((row) => row.id == rowData.id);
    return dataIndex;
  }

  void sort() {
    insertionSort(rowData, compare: compare);
  }

  bool acceptsRow(S rowData) {
    return criteria(rowData);
  }
}

class RoofUIStreamableTableData extends RoofUIStreamableData {
  RoofUIStreamableTableHeaderData headerData;

  //Sections should never be changed or removed.
  final List<RoofUIStreamableSectionData> sectionData;

  RoofUIStreamableTableData({this.headerData, this.sectionData, rowData}) {
    _sortWithRowData(rowData);
  }

  void replaceLocation(TableLocation location, RoofUIStreamableData rowData) {
    final sectionData = this.sectionData[location.sectionIndex];
    sectionData.replaceIndex(location.rowIndex, rowData);
  }

  void addRowData(RoofUIStreamableData rowData, int index) {
    if (index < 0 || index >= this.sectionData.length) return;

    final sectionData = this.sectionData[index];
    sectionData.addRowData(rowData);
  }

  void removeAtLocation(TableLocation location) {
    final sectionData = this.sectionData[location.sectionIndex];
    sectionData.removeRowDataAtIndex(location.rowIndex);
  }

  RoofUIStreamableData rowDataAt(TableLocation location) {
    final sectionData = this.sectionData[location.sectionIndex];
    final rowData = sectionData.rowData[location.rowIndex];
    return rowData;
  }

  void sort() {
    //Dump all rows from all sections into a list.
    final rowData = sectionData.expand((sectionData) => sectionData.rowData);
    _sortWithRowData(rowData);
  }

  void _sortWithRowData(List<RoofUIStreamableData> rowData) {
    //Empty all sections.
    sectionData.forEach((sectionData) =>
        sectionData.rowData.removeRange(0, sectionData.rowData.length));

    //Add the rows to their correct sections.
    rowData.forEach((rowData) {
      for (final sectionData in sectionData) {
        if (!sectionData.acceptsRow(rowData)) continue;
        sectionData.addRowData(rowData);
        return;
      }
    });

    //Sort the sections.
    sectionData.forEach((sectionData) => sectionData.sort());
  }

  TableLocation locationOfRowData(RoofUIStreamableData rowData) {
    for (int i = 0; i < sectionData.length; i++) {
      final sectionData = this.sectionData[i];
      final dataIndex = sectionData.indexOfRowData(rowData);
      if (dataIndex < 0) continue;

      return TableLocation(rowIndex: dataIndex, sectionIndex: i);
    }
    return null;
  }
}

class RoofUIStreamableSectionHeaderData extends RoofUIStreamableData {
  String title;

  RoofUIStreamableSectionHeaderData({this.title});
}

class RoofUIStreamableTableHeaderData extends RoofUIStreamableData {
  String title;

  RoofUIStreamableTableHeaderData({this.title});
}

class TableLocation {
  final rowIndex;
  final sectionIndex;

  TableLocation({this.rowIndex, this.sectionIndex});
}
