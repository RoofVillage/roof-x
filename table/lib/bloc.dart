export 'data/index.dart';

import 'dart:async';
import 'package:stream/index.dart';

import 'data/index.dart';
import 'util/index.dart';

class StreamTableBloc implements BlocBase {
  StreamableTableData _tableData;

  //The stream responsible for communicating changes to the entire table.
  final _tableController = StreamController<StreamableTableData>();

  //The stream responsible for communicating changes to sections.
  final _sectionController =
      StreamController<StreamableTableSectionData>.broadcast();

  //The stream responsible for communicating changes to items within the list.
  final _rowController = StreamController<StreamableTableRowData>.broadcast();

  //Set the table's first value.
  set _initialTableData(StreamableTableData initialTableData) {
    if (_tableData != null) return;
    _tableData = initialTableData;
    _inTable.add(_tableData);
  }

  Sink<StreamableTableData> get _inTable => _tableController.sink;
  Stream<StreamableTableData> get outTable => _tableController.stream;

  Sink<StreamableTableSectionData> get _inSection => _sectionController.sink;
  Stream<StreamableTableSectionData> get outSection =>
      _sectionController.stream;

  Sink<StreamableTableRowData> get _inRow => _rowController.sink;
  Stream<StreamableTableRowData> get outRow => _rowController.stream;

  StreamTableBloc() {
    _init();
  }

  StreamTableBloc.withInitialData(Future<StreamableTableData> initialData) {
    _init(initialData: initialData);
  }

  //Override to make the table.
  Future<StreamableTableData> createTableData() async {
    return StreamableTableData();
  }

  void updateRowData(StreamableTableRowData rowData) {
    batchUpdateRowData([rowData]);
  }

  void updateInsertRowData(StreamableTableRowData rowData) {
    batchInsertRowData([rowData]);
  }

  void removeRowData(StreamableTableRowData rowData) {
    batchRemoveRowData([rowData]);
  }

  void batchUpdateRowData(List<StreamableTableRowData> rowData) {
    //Store locations before sorting.
    final Map<String, TableLocation> originalTableLocations = {};

    //Update each rowData.
    rowData.forEach((data) {
      //Find where the row currently is in the table.
      final originalLocation = _tableData.tableLocationOfRowData(data);

      //If the location cant be found, exit gracefully.
      if (originalLocation == null) return;

      //Replace the old occurance of the data with the new version.
      _tableData.replaceTableLocation(originalLocation, data);

      //Save the original location.
      originalTableLocations[data.key] = originalLocation;
    });

    //The correct order might have changed so sort again.
    _tableData.sort();

    //Only update the rows or sections that changed.
    final List<int> sectionIndexesToUpdate = [];
    final List<TableLocation> tableLocationsToUpdate = [];
    rowData.forEach((data) {
      //Find where the new location of the data is.
      final newTableLocation = _tableData.tableLocationOfRowData(data);
      final originalTableLocation = originalTableLocations[data.key];

      //If the data's section changed, both sections need updating.
      if (originalTableLocation.sectionIndex != newTableLocation.sectionIndex) {
        sectionIndexesToUpdate.addAll([
          originalTableLocation.sectionIndex,
          newTableLocation.sectionIndex
        ]);
      }

      //If the data's section didn't change but the row did, the section needs updating.
      else if (originalTableLocation.rowIndex != newTableLocation.rowIndex) {
        sectionIndexesToUpdate.add(newTableLocation.rowIndex);
      }

      //If the data's section nor row changed, the row needs updating.
      else {
        tableLocationsToUpdate.add(newTableLocation);
      }
    });

    _postDataToSectionIndexes(sectionIndexesToUpdate);

    //Post messages to rows. Convert to set to remove duplicated.
    tableLocationsToUpdate.toSet().forEach((location) {
      //Dont notify the row if the section has already been notified.
      if (sectionIndexesToUpdate.contains(location.sectionIndex)) return;
      final rowData = _tableData.rowDataAt(location);
      _inRow.add(rowData);
    });
  }

  void batchInsertRowData(List<StreamableTableRowData> rowData,
      {int sectionIndex = 0}) {
    //Add each rowData to the table.
    rowData.forEach((data) {
      _tableData.addRowData(data, sectionIndex);
    });

    //Sort the table to put the new rows in the correct spot.
    _tableData.sort();

    //Only update the rows or sections that changed.
    final List<int> sectionIndexesToUpdate = [];
    rowData.forEach((data) {
      //Find where the new location of the data is.
      final newLocation = _tableData.tableLocationOfRowData(data);
      sectionIndexesToUpdate.add(newLocation.sectionIndex);
    });

    _postDataToSectionIndexes(sectionIndexesToUpdate);
  }

  void batchRemoveRowData(List<StreamableTableRowData> rowData) {
    //Remove each rowData from the table.
    rowData.forEach((data) {
      //Get the location of the row being removed
      final location = _tableData.tableLocationOfRowData(data);

      //If the location cant be found, exit gracefully;
      if (location == null) return;

      //Remove the data.
      _tableData.removeAtTableLocation(location);

      //Mark the row as hidden.
      data.hidden = true;

      //Post a message that the row changed.
      _inRow.add(data);
    });
  }

  @override
  void dispose() {
    _tableController.close();
    _sectionController.close();
    _rowController.close();
  }

  void _postDataToSectionIndexes(List<int> sectionIndexes) {
    //Post data to sections. Convert to set to remove duplicated.
    sectionIndexes.toSet().forEach((sectionIndex) {
      final sectionData = _tableData.sectionData[sectionIndex];
      _inSection.add(sectionData);
    });
  }

  void _init({Future<StreamableTableData> initialData}) async {
    _initialTableData = await initialData ?? createTableData();
  }
}
