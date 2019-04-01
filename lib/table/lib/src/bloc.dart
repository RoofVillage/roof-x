import 'dart:async';

import 'package:stream/index.dart';

import 'data/index.dart';
import 'util/index.dart';

class StreamTableBloc implements BlocBase {
  StreamableTableData _tableData;

  //The stream responsible for communicating changes to the entire table.
  final _tableController = StreamController<StreamableTableData>();

  Sink<StreamableTableData> get _inTable => _tableController.sink;
  Stream<StreamableTableData> get outTable => _tableController.stream;

  void updateRowData(StreamableTableRowData rowData) {
    batchUpdateRowData([rowData]);
  }

  void updateInsertRowData(StreamableTableRowData rowData) {
    batchInsertRowData([rowData]);
  }

  void removeRowData(StreamableTableRowData rowData) {
    batchRemoveRowData([rowData]);
  }

  void update(StreamableTableData tableData) {
    _tableData = tableData;
    _inTable.add(_tableData);
  }

  void batchUpdateRowData(List<StreamableTableRowData> rowData) {
    //Store locations before sorting.
    final Map<String, TableLocation> originalTableLocations = {};

    //Update each rowData.
    for (final data in rowData) {
      //Find where the row currently is in the table.
      final originalLocation = _tableData.tableLocationOfRowData(data);

      //If the location cant be found, exit gracefully.
      if (originalLocation == null) return;

      //Replace the old occurance of the data with the new version.
      _tableData.replaceTableLocation(originalLocation, data);

      //Save the original location.
      originalTableLocations[data.key] = originalLocation;
    }

    //The correct order might have changed so sort again.
    _tableData.sort();

    _inTable.add(_tableData);
  }

  void batchInsertRowData(List<StreamableTableRowData> rowData,
      {int sectionIndex = 0}) {
    if (rowData.isEmpty) return;

    //Add each rowData to the table.
    for (final data in rowData) {
      _tableData.addRowData(data, sectionIndex);
    }

    //Sort the table to put the new rows in the correct spot.
    _tableData.sort();

    _inTable.add(_tableData);
  }

  void batchRemoveRowData(List<StreamableTableRowData> rowData) {
    //Remove each rowData from the table.
    for (final data in rowData) {
      //Get the location of the row being removed
      final location = _tableData.tableLocationOfRowData(data);

      //If the location cant be found, exit gracefully;
      if (location == null) return;

      //Remove the data.
      _tableData.removeAtTableLocation(location);

      //Post a message that the row changed.
      _inTable.add(_tableData);
    }
  }

  @override
  void dispose() {
    _tableController.close();
  }
}
