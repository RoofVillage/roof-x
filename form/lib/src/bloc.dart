import 'dart:async';
import 'package:stream/index.dart';

import 'data/index.dart';

typedef void ChangeListener();

class StreamFormBloc extends BlocBase {
  StreamableFormData _formData;

  StreamableFormData get formData => _formData;

  ChangeListener onValueChange;
  ChangeListener onFocus;
  ChangeListener onResignFocus;

  //The stream responsible for communicating changes to the entire form.
  final _formController = StreamController<StreamableFormData>();

  Sink<StreamableFormData> get _inForm => _formController.sink;
  Stream<StreamableFormData> get outForm => _formController.stream;

  //Override to handle field changes;
  void fieldChanged(String fieldKey, dynamic oldValue, dynamic newValue) {}

  void update(StreamableFormData formData) {
    _addValueChangedStreamToForm(formData);
    _formData = formData;
    _inForm.add(_formData);
  }

  void updateFieldData(StreamableFormFieldData fieldData) {
    _formData.updateFieldData(fieldData);
    update(_formData);
  }

  void updateSectionData(StreamableFormSectionData sectionData) {
    _addValueChangedStreamToFields(sectionData.fieldData);
    _formData.updateSectionData(sectionData);
    _inForm.add(_formData);
  }

  void batchUpdateSectionData(List<StreamableFormSectionData> sectionData) {
    for (final data in sectionData) updateSectionData(data);
  }

  void batchUpdateFieldData(List<StreamableFormFieldData> fieldData) {
    if (fieldData.isEmpty) return;
    for (final data in fieldData) updateFieldData(data);
  }

  void insertFieldData(StreamableFormFieldData fieldData) {
    _addValueChangedStreamToField(fieldData);
    _formData.addFieldData(fieldData);
    _inForm.add(_formData);
  }

  void batchInsertFieldData(List<StreamableFormFieldData> fieldData) {
    if (fieldData.isEmpty) return;
    for (final data in fieldData) _addValueChangedStreamToField(data);
    _formData.batchAddFieldData(fieldData);
    _inForm.add(_formData);
  }

  void insertFieldDataBefore(StreamableFormFieldData fieldData,
      StreamableFormFieldData beforeFieldData) {
    _addValueChangedStreamToField(fieldData);
    _formData.addFieldDataBefore(fieldData, beforeFieldData);
    _inForm.add(_formData);
  }

  void batchInsertFieldDataBefore(List<StreamableFormFieldData> fieldData,
      StreamableFormFieldData beforeFieldData) {
    if (fieldData.isEmpty) return;
    for (final data in fieldData) _addValueChangedStreamToField(data);
    _formData.batchAddFieldDataBefore(fieldData, beforeFieldData);
    _inForm.add(_formData);
  }

  void insertFieldDataAfter(StreamableFormFieldData fieldData,
      StreamableFormFieldData afterFieldData) async {
    _addValueChangedStreamToField(fieldData);
    _formData.addFieldDataAfter(fieldData, afterFieldData);
    _inForm.add(_formData);
  }

  void batchInsertFieldDataAfter(List<StreamableFormFieldData> fieldData,
      StreamableFormFieldData afterFieldData) {
    if (fieldData.isEmpty) return;
    for (final data in fieldData) _addValueChangedStreamToField(data);
    _formData.batchAddFieldDataAfter(fieldData, afterFieldData);
    _inForm.add(_formData);
  }

  void insertSectionData(StreamableFormSectionData sectionData) {
    for (final data in sectionData.fieldData) {
      _addValueChangedStreamToField(data);
    }
    _formData.addSectionData(sectionData);
    _inForm.add(_formData);
  }

  void batchInsertSectionData(List<StreamableFormSectionData> sectionData) {
    final fieldData = sectionData.expand((data) => data.fieldData);
    for (final data in fieldData) _addValueChangedStreamToField(data);
    _formData.batchAddSectionData(sectionData);
    _inForm.add(_formData);
  }

  void insertSectionDataBefore(StreamableFormSectionData sectionData,
      StreamableFormSectionData beforeSectionData) {
    for (final data in sectionData.fieldData) {
      _addValueChangedStreamToField(data);
    }
    _formData.addSectionDataBefore(sectionData, beforeSectionData);
    _inForm.add(_formData);
  }

  void batchInsertSectionDataBefore(List<StreamableFormSectionData> sectionData,
      StreamableFormSectionData beforeSectionData) {
    final fieldData = sectionData.expand((data) => data.fieldData);
    for (final data in fieldData) _addValueChangedStreamToField(data);
    _formData.batchAddSectionDataBefore(sectionData, beforeSectionData);
    _inForm.add(_formData);
  }

  void insertSectionDataAfter(StreamableFormSectionData sectionData,
      StreamableFormSectionData afterSectionData) {
    for (final data in sectionData.fieldData) {
      _addValueChangedStreamToField(data);
    }
    _formData.addSectionDataAfter(sectionData, afterSectionData);
    _inForm.add(_formData);
  }

  void batchInsertSectionDataAfter(List<StreamableFormSectionData> sectionData,
      StreamableFormSectionData afterSectionData) {
    final fieldData = sectionData.expand((data) => data.fieldData);
    for (final data in fieldData) _addValueChangedStreamToField(data);
    _formData.batchAddSectionDataAfter(sectionData, afterSectionData);
    _inForm.add(_formData);
  }

  void removeFieldData(StreamableFormFieldData fieldData) {
    //Remove the data.
    _formData.removeFieldData(fieldData);

    //Post a message that the form changed.
    _inForm.add(_formData);
  }

  void removeSectionData(StreamableFormSectionData sectionData) {
    //Remove the data.
    _formData.removeSectionData(sectionData);

    //Post a message that the form changed.
    _inForm.add(_formData);
  }

  @override
  void dispose() {
    _formController.close();
  }

  void _addValueChangedStreamToForm(StreamableFormData formData) {
    _addValueChangedStreamToFields(formData.fieldData);
  }

  void _addValueChangedStreamToField(StreamableFormFieldData fieldData) {
    _addValueChangedStreamToFields([fieldData]);
  }

  void _addValueChangedStreamToFields(List<StreamableFormFieldData> fieldData) {
    for (final fieldData in fieldData) {
      if (fieldData.tracked) continue;
      fieldData.addOnChangedListener((newValue) {
        if (onValueChange != null) onValueChange();
      });
      fieldData.addOnFocusChangedListener((newFocusValue) {
        if (fieldData.isInFocus == newFocusValue) return;
        final hasFocusedFieldBefore = _hasFocusedField();

        if (newFocusValue == !hasFocusedFieldBefore) {
          if (newFocusValue && onFocus != null) {
            onFocus();
          } else if (!newFocusValue && onResignFocus != null) {
            onResignFocus();
          }
        }
      });
      fieldData.markAsTracked();
    }
  }

  bool _hasFocusedField() {
    for (final fieldData in _formData.fieldData) {
      if (fieldData.isInFocus) return true;
    }
    return false;
  }
}
