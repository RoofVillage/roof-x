import 'dart:async';
import 'package:stream/bloc_base.dart';

import 'data/index.dart';

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

  //The stream responsible for communicating changes to field values within the form;
  final _fieldValueController =
      StreamController<StreamableFormFieldValueData>.broadcast();

  //Set the form first value.
  set _initialFormData(StreamableFormData initialFormData) {
    if (_formData != null) return;

    _addValueChangedStreamToForm(initialFormData);

    _formData = initialFormData;
    _inForm.add(_formData);
  }

  Sink<StreamableFormData> get _inForm => _formController.sink;
  Stream<StreamableFormData> get outForm => _formController.stream;

  Sink<StreamableFormSectionData> get _inSection => _sectionController.sink;
  Stream<StreamableFormSectionData> get outSection => _sectionController.stream;

  Sink<StreamableFormFieldData> get _inField => _fieldController.sink;
  Stream<StreamableFormFieldData> get outField => _fieldController.stream;

  Sink<StreamableFormFieldValueData> get _inFieldValue =>
      _fieldValueController.sink;
  Stream<StreamableFormFieldValueData> get _outFieldValue =>
      _fieldValueController.stream;

  StreamFormBloc() {
    _init();
  }

  //Override to make the table.
  Future<StreamableFormData> createFormData() async {
    return StreamableFormData();
  }

  //Override to handle field changes;
  void fieldChanged(String fieldKey, dynamic oldValue, dynamic newValue) {}

  void toggleFieldDataVisibility(StreamableFormFieldData fieldData) {
    fieldData.hidden = !fieldData.hidden;
    updateFieldData(fieldData);
  }

  void toggleSectionDataVisibility(StreamableFormSectionData sectionData) {
    sectionData.hidden = !sectionData.hidden;
    updateSectionData(sectionData);
  }

  void updateFieldData(StreamableFormFieldData fieldData) {
    _formData.updateField(fieldData);
    _inField.add(fieldData);
  }

  void updateSectionData(StreamableFormSectionData sectionData) {
    _formData.updateSection(sectionData);
    _inSection.add(sectionData);
  }

  void insertFieldDataAfter(StreamableFormFieldData fieldData,
      StreamableFormFieldData afterFieldData) {
    _addValueChangedStreamToField(fieldData);

    //Add the fieldData to the form.
    _formData.addFieldDataAfter(fieldData, afterFieldData);

    //Find where the new location of the data is.
    final newLocation = _formData.formLocationOfFieldData(fieldData);
    final sectionData = _formData.sectionData[newLocation.sectionIndex];
    _inSection.add(sectionData);
  }

  void insertFieldDataBefore(StreamableFormFieldData fieldData,
      StreamableFormFieldData beforeFieldData) {
    _addValueChangedStreamToField(fieldData);

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
    _fieldValueController.close();
  }

  void _init() async {
    _initialFormData = await createFormData();
  }

  void _addValueChangedStreamToForm(StreamableFormData formData) {
    _addValueChangedStreamToFields(formData.fieldData);
  }

  void _addValueChangedStreamToField(StreamableFormFieldData fieldData) {
    _addValueChangedStreamToFields([fieldData]);
  }

  void _addValueChangedStreamToFields(List<StreamableFormFieldData> fieldData) {
    fieldData.forEach((fieldData) {
      fieldData.onChanged = (newValue) {
        final fieldValueData = StreamableFormFieldValueData(
            fieldKey: fieldData.key, value: newValue);
        _inFieldValue.add(fieldValueData);
      };
      _outFieldValue
          .where((valueData) => valueData.fieldKey == fieldData.key)
          .listen((valueData) => fieldData.value = valueData.value);
    });
  }

  // void _postDataForChangeAtLocation(FormLocation formLocation) {
  //   final fieldDataInSameSection =
  //       _formData.sectionData[formLocation.sectionIndex].fieldData;
  //   final fieldDataToReload = fieldDataInSameSection.getRange(
  //       formLocation.fieldIndex, fieldDataInSameSection.length);
  //   fieldDataToReload.forEach((fieldData) => _inField.add(fieldData));
  // }
}
