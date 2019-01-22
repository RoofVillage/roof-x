import 'dart:async';
import 'package:stream/bloc_base.dart';

import './data/index.dart';

class StreamFormBloc extends BlocBase {
  StreamableFormData _formData;

  //The stream responsible for communicating changes to the entire form.
  final _formController = StreamController<StreamableFormData>();

  //The stream responsible for communicating changes to sections.
  final _sectionController =
      StreamController<StreamableFormSectionData>.broadcast();

  //The stream responsible for communicating changes to fields within the form;
  final _fieldController =
      StreamController<StreamableFormFieldData>.broadcast();

  //Set the form first value.
  set _initialFormData(StreamableFormData initialFormData) {
    if (_formData != null) return;
    _formData = initialFormData;
    _inForm.add(_formData);
  }

  Sink<StreamableFormData> get _inForm => _formController.sink;
  Stream<StreamableFormData> get outForm => _formController.stream;

  Sink<StreamableFormSectionData> get _inSection => _sectionController.sink;
  Stream<StreamableFormSectionData> get outSection => _sectionController.stream;

  Sink<StreamableFormFieldData> get _inField => _fieldController.sink;
  Stream<StreamableFormFieldData> get outField => _fieldController.stream;

  StreamFormBloc() {
    _init();
  }

  //Override to make the table.
  Future<StreamableFormData> createFormData() async {
    return StreamableFormData();
  }

  void toggleFieldDataVisibility(StreamableFormFieldData fieldData) {
    fieldData.hidden = !fieldData.hidden;
    updateFieldData(fieldData);
  }

  void updateFieldData(StreamableFormFieldData fieldData) {
    _formData.updateField(fieldData);
    _inField.add(fieldData);
  }

  void insertFieldDataAfter(StreamableFormFieldData fieldData,
      StreamableFormFieldData afterFieldData) {
    //Add the fieldData to the form.
    _formData.addFieldDataAfter(fieldData, afterFieldData);

    //Find where the new location of the data is.
    final newLocation = _formData.formLocationOfFieldData(fieldData);
    final sectionData = _formData.sectionData[newLocation.sectionIndex];
    _inSection.add(sectionData);
  }

  void insertFieldDataBefore(StreamableFormFieldData fieldData,
      StreamableFormFieldData beforeFieldData) {
    //Add the fieldData to the form.
    _formData.addFieldDataBefore(fieldData, beforeFieldData);

    //Find where the new location of the data is.
    final newLocation = _formData.formLocationOfFieldData(fieldData);
    final sectionData = _formData.sectionData[newLocation.sectionIndex];
    _inSection.add(sectionData);
  }

  void removeFieldData(StreamableFormFieldData fieldData) {
    //Get the location of the field being removed
    final location = _formData.formLocationOfFieldData(fieldData);

    //If the location cant be found, exit gracefully;
    if (location == null) return;

    //Remove the data.
    _formData.removeAtFormLocation(location);

    //Mark the row as hidden.
    fieldData.hidden = true;

    //Post a message that the row changed.
    _inField.add(fieldData);
  }

  @override
  void dispose() {
    _formController.close();
    _sectionController.close();
    _fieldController.close();
  }

  void _init() async {
    _initialFormData = await createFormData();
  }

  // void _postDataForChangeAtLocation(FormLocation formLocation) {
  //   final fieldDataInSameSection =
  //       _formData.sectionData[formLocation.sectionIndex].fieldData;
  //   final fieldDataToReload = fieldDataInSameSection.getRange(
  //       formLocation.fieldIndex, fieldDataInSameSection.length);
  //   fieldDataToReload.forEach((fieldData) => _inField.add(fieldData));
  // }
}
