import 'dart:async';

import './roofui_streamable_data.dart';
import './roofui_bloc_base.dart';

class RoofUITableBloc implements RoofUIBlocBase {
  RoofUIStreamableTableData _tableData;

  //The stream responsible for communicating changes to the entire table;
  final _tableController = StreamController<RoofUIStreamableTableData>();

  //The stream responsible for communicating changes to sections;
  final _sectionController = StreamController<RoofUIStreamableSectionData>();

  //The stream responsible for communicating changes to items within the list;
  final _rowController = StreamController<RoofUIStreamableData>.broadcast();

  //Set the lists first value.
  set _initialTableData(RoofUIStreamableTableData initialTable) {
    if (_tableData != null) return;
    _tableData = initialTable;
    _inTable.add(_tableData);
  }

  Sink<RoofUIStreamableTableData> get _inTable => _tableController.sink;
  Stream<RoofUIStreamableTableData> get outTable => _tableController.stream;

  Sink<RoofUIStreamableSectionData> get _inSection => _sectionController.sink;
  Stream<RoofUIStreamableSectionData> get outSection =>
      _sectionController.stream;

  Sink<RoofUIStreamableData> get _inRow => _rowController.sink;
  Stream<RoofUIStreamableData> get outRow => _rowController.stream;

  RoofUITableBloc() {
    _init();
  }

  //Override to make the table.
  Future<RoofUIStreamableTableData> createTableData() async {
    return RoofUIStreamableTableData();
  }

  void updateRowData(List<RoofUIStreamableData> rowData) {
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
      originalTableLocations[data.id] = originalLocation;
    });

    //The correct order might have changed so sort again.
    _tableData.sort();

    //Only update the rows or sections that changed.
    final List<int> sectionIndexesToUpdate = [];
    final List<TableLocation> tableLocationsToUpdate = [];
    rowData.forEach((data) {
      //Find where the new location of the data is.
      final newTableLocation = _tableData.tableLocationOfRowData(data);
      final originalTableLocation = originalTableLocations[data.id];

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

  void insertRowData(List<RoofUIStreamableData> rowData,
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

  void removeRowData(List<RoofUIStreamableData> rowData) {
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

  void _init() async {
    _initialTableData = await createTableData();
  }
}
