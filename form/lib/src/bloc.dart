import 'dart:async';
import 'package:stream/index.dart';

import 'data/index.dart';

typedef AddressGetter = String Function();
typedef ParamsGetter = Map<String, Object> Function();
typedef SubmitGetter = Future<void> Function();
typedef ValidationGetter = Future<void> Function();
typedef ErrorHandlerGetter = Function(String message);

class StreamFormBloc extends BlocBase {
  AddressGetter getAddress;
  ParamsGetter getParams;
  SubmitGetter getSubmit;
  ValidationGetter getValidation;
  ErrorHandlerGetter getErrorHandler;

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

  void submit() async {
    final submit = getSubmit;
    if (submit == null) return;

    try {
      print("HI");
      _validateFields();
      final validation = getValidation;
      if (validation != null) await validation();
    } catch (err) {
      final errorHandler = getErrorHandler;
      print(err.toString());
      if (errorHandler != null) errorHandler(err.toString());
    }

    await submit();
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
    _formData.updateFieldData(fieldData);
    _inField.add(fieldData);
  }

  void updateSectionData(StreamableFormSectionData sectionData) {
    _formData.updateSectionData(sectionData);
    _inSection.add(sectionData);
  }

  void update(StreamableFormData formData) {
    _addValueChangedStreamToForm(formData);

    _formData = formData;
    _inForm.add(_formData);
  }

  void batchUpdateSectionData(List<StreamableFormSectionData> sectionData) {
    for (final sectionData in sectionData) {
      updateSectionData(sectionData);
    }
  }

  void batchUpdateFieldData(List<StreamableFormFieldData> fieldData) {
    for (final fieldData in fieldData) {
      updateFieldData(fieldData);
    }
  }

  void insertFieldData(StreamableFormFieldData fieldData) {
    _addValueChangedStreamToField(fieldData);

    //Add the fieldData to the form.
    _formData.addFieldData(fieldData);

    //Find where the new location of the data is.
    final newLocation = _formData.formLocationOfFieldData(fieldData);
    final sectionData = _formData.sectionData[newLocation.sectionIndex];
    _inSection.add(sectionData);
  }

  void batchInsertFieldData(List<StreamableFormFieldData> fieldData) {
    if (fieldData == null || fieldData.isEmpty) return;

    for (final fieldData in fieldData) {
      _addValueChangedStreamToField(fieldData);
    }

    //Add the fieldData to the form.
    _formData.batchAddFieldData(fieldData);

    //Find where the new location of the data is.
    final newLocation = _formData.formLocationOfFieldData(fieldData.first);
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

  void batchInsertFieldDataBefore(List<StreamableFormFieldData> fieldData,
      StreamableFormFieldData beforeFieldData) {
    if (fieldData == null || fieldData.isEmpty) return;
    for (final fieldData in fieldData) {
      _addValueChangedStreamToField(fieldData);
    }

    //Add the fieldData to the form.
    _formData.batchAddFieldDataBefore(fieldData, beforeFieldData);

    //Find where the new location of the data is.
    final newLocation = _formData.formLocationOfFieldData(fieldData.first);
    final sectionData = _formData.sectionData[newLocation.sectionIndex];
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

  void batchInsertFieldDataAfter(List<StreamableFormFieldData> fieldData,
      StreamableFormFieldData afterFieldData) {
    if (fieldData == null || fieldData.isEmpty) return;

    for (final fieldData in fieldData) {
      _addValueChangedStreamToField(fieldData);
    }

    //Add the fieldData to the form.
    _formData.batchAddFieldDataAfter(fieldData, afterFieldData);

    //Find where the new location of the data is.
    final newLocation = _formData.formLocationOfFieldData(fieldData.first);
    final sectionData = _formData.sectionData[newLocation.sectionIndex];
    _inSection.add(sectionData);
  }

  void insertSectionData(StreamableFormSectionData sectionData) {
    for (final fieldData in sectionData.fieldData) {
      _addValueChangedStreamToField(fieldData);
    }

    //Add the sectionData to the form.
    _formData.addSectionData(sectionData);

    _inForm.add(_formData);
  }

  void batchInsertSectionData(List<StreamableFormSectionData> sectionData) {
    for (final sectionData in sectionData) {
      for (final fieldData in sectionData.fieldData) {
        _addValueChangedStreamToField(fieldData);
      }
    }

    //Add the fieldData to the form.
    _formData.batchAddSectionData(sectionData);

    _inForm.add(_formData);
  }

  void insertSectionDataBefore(StreamableFormSectionData sectionData,
      StreamableFormSectionData beforeSectionData) {
    for (final fieldData in sectionData.fieldData) {
      _addValueChangedStreamToField(fieldData);
    }

    _formData.addSectionDataBefore(sectionData, beforeSectionData);

    _inForm.add(_formData);
  }

  void batchInsertSectionDataBefore(List<StreamableFormSectionData> sectionData,
      StreamableFormSectionData beforeSectionData) {
    for (final sectionData in sectionData) {
      for (final fieldData in sectionData.fieldData) {
        _addValueChangedStreamToField(fieldData);
      }
    }

    _formData.batchAddSectionDataBefore(sectionData, beforeSectionData);

    _inForm.add(_formData);
  }

  void insertSectionDataAfter(StreamableFormSectionData sectionData,
      StreamableFormSectionData afterSectionData) {
    for (final fieldData in sectionData.fieldData) {
      _addValueChangedStreamToField(fieldData);
    }

    _formData.addSectionDataAfter(sectionData, afterSectionData);

    _inForm.add(_formData);
  }

  void batchInsertSectionDataAfter(List<StreamableFormSectionData> sectionData,
      StreamableFormSectionData afterSectionData) {
    for (final sectionData in sectionData) {
      for (final fieldData in sectionData.fieldData) {
        _addValueChangedStreamToField(fieldData);
      }
    }

    _formData.batchAddSectionDataAfter(sectionData, afterSectionData);

    _inForm.add(_formData);
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

  void _addValueChangedStreamToForm(StreamableFormData formData) {
    _addValueChangedStreamToFields(formData.fieldData);
  }

  void _addValueChangedStreamToField(StreamableFormFieldData fieldData) {
    _addValueChangedStreamToFields([fieldData]);
  }

  void _addValueChangedStreamToFields(List<StreamableFormFieldData> fieldData) {
    for (var fieldData in fieldData) {
      fieldData.onChanged = (newValue) {
        final fieldValueData = StreamableFormFieldValueData(
            fieldKey: fieldData.key, value: newValue);
        _inFieldValue.add(fieldValueData);
      };
      _outFieldValue
          .where((valueData) => valueData.fieldKey == fieldData.key)
          .listen((valueData) => fieldData.value = valueData.value);
    }
  }

  Future<void> _validateFields() async {
    try {
      for (final data in _formData.fieldData) {
        await data.validate();
      }
    } catch (err) {
      print(err.toString());
    }
  }
}
