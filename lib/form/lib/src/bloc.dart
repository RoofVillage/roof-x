import 'dart:async';
import 'package:form/index.dart';
import 'package:stream/index.dart';
import 'package:typedefs/index.dart';

import 'data/field.dart';
import 'data/section.dart';
import 'data/form.dart';

class StreamFormBloc extends BlocBase {
  StreamableFormData _formData;

  StreamableFormData get formData => _formData;

  EventListener get onValueChanged => () {
        for (final listener in _onValueChangedListeners) listener();
      };
  FlagListener get onFocusChanged => (bool isInFocus) {
        for (final listener in _onFocusChangedListeners) listener(isInFocus);
      };

  List<EventListener> _onValueChangedListeners = [];
  List<FlagListener> _onFocusChangedListeners = [];

  //The stream responsible for communicating changes to the entire form.
  final _formController = StreamController<StreamableFormData>();

  Sink<StreamableFormData> get _inForm => _formController.sink;
  Stream<StreamableFormData> get outForm => _formController.stream;

  //Override to handle field changes;
  void fieldChanged(String fieldKey, dynamic oldValue, dynamic newValue) {}

  void addOnValueChangedListener(EventListener listener) {
    if (_onValueChangedListeners.contains(listener)) return;
    _onValueChangedListeners.add(listener);
  }

  void addOnFocusChangedListener(FlagListener listener) {
    if (_onFocusChangedListeners.contains(listener)) return;
    _onFocusChangedListeners.add(listener);
  }

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
    _formData.batchUpdateFieldData(fieldData);
    _inForm.add(_formData);
  }

  void insertFieldData(
    StreamableFormFieldData fieldData, {
    StreamableFormFieldData before,
    StreamableFormFieldData after,
  }) {
    assert(before == null || after == null,
        'Cannot provide arguments for both before and after.');

    _addValueChangedStreamToField(fieldData);
    if (before != null) {
      _formData.addFieldDataBefore(fieldData, before);
    } else if (after != null) {
      _formData.addFieldDataAfter(fieldData, after);
    } else {
      _formData.addFieldData(fieldData);
    }
    _inForm.add(_formData);
  }

  void batchInsertFieldData(List<StreamableFormFieldData> fieldData) {
    if (fieldData.isEmpty) return;
    for (final data in fieldData) _addValueChangedStreamToField(data);
    _formData.batchAddFieldData(fieldData);
    _inForm.add(_formData);
  }

  @deprecated // use insertFieldData
  void insertFieldDataBefore(
    StreamableFormFieldData fieldData, {
    StreamableFormFieldData beforeFieldData,
  }) {
    _addValueChangedStreamToField(fieldData);
    _formData.addFieldDataBefore(fieldData, beforeFieldData);
    _inForm.add(_formData);
  }

  void batchInsertFieldDataBefore(
    List<StreamableFormFieldData> fieldData, {
    StreamableFormFieldData beforeFieldData,
  }) {
    if (fieldData.isEmpty) return;
    for (final data in fieldData) _addValueChangedStreamToField(data);
    _formData.batchAddFieldDataBefore(fieldData, beforeFieldData);
    _inForm.add(_formData);
  }

  @deprecated // use insertFieldData
  void insertFieldDataAfter(
    StreamableFormFieldData fieldData, {
    StreamableFormFieldData afterFieldData,
  }) async {
    _addValueChangedStreamToField(fieldData);
    _formData.addFieldDataAfter(fieldData, afterFieldData);
    _inForm.add(_formData);
  }

  void batchInsertFieldDataAfter(
    List<StreamableFormFieldData> fieldData, {
    StreamableFormFieldData afterFieldData,
  }) {
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

  void batchRemoveFieldData(List<StreamableFormFieldData> fieldData) {
    for (final _data in fieldData) {
      _formData.removeFieldData(_data);
    }
    _inForm.add(_formData);
  }

  void removeSectionData(StreamableFormSectionData sectionData) {
    //Remove the data.
    _formData.removeSectionData(sectionData);

    //Post a message that the form changed.
    _inForm.add(_formData);
  }

  void overwriteWithSectionData(List<StreamableFormSectionData> sectionData) {
    final fieldData = sectionData.expand((data) => data.fieldData);
    for (final data in fieldData) _addValueChangedStreamToField(data);
    _formData.sectionData.clear();
    _formData.batchAddSectionData(sectionData);
    _inForm.add(_formData);
  }

  void overwriteWithFieldData(List<StreamableFormFieldData> fieldData) {
    for (final data in fieldData) _addValueChangedStreamToField(data);
    _formData.sectionData.clear();
    _formData.batchAddFieldData(fieldData);
    _inForm.add(_formData);
  }

  void enableFields() async {
    for (final data in formData.fieldData) data.isEnabled = true;
    batchUpdateFieldData(formData.fieldData);
  }

  void disableFields() async {
    for (final data in formData.fieldData) data.isEnabled = false;
    batchUpdateFieldData(formData.fieldData);
  }

  @override
  void dispose() {
    _formController.close();
    _onValueChangedListeners.clear();
    _onFocusChangedListeners.clear();
  }

  void _addValueChangedStreamToForm(StreamableFormData formData) {
    _addValueChangedStreamToFields(formData.fieldData);
  }

  void _addValueChangedStreamToField(StreamableFormFieldData fieldData) {
    _addValueChangedStreamToFields([fieldData]);
  }

  void _addValueChangedStreamToFields(List<StreamableFormFieldData> fieldData) {
    for (final fieldData in fieldData) {
      if (fieldData.isTracked) continue;
      fieldData.addOnChangedListener((newValue) => onValueChanged());
      fieldData.addOnFocusChangedListener((fieldHasFocus) {
        //Determine if the form previously had focus before this change.
        //If the field is resigning focus, the form had focus before.
        //Otherwise if the field is gaining focus, see if there is another field
        //currently with focus.
        final formHadFocusedFieldBefore =
            !fieldHasFocus || _hasFocusedField(ignoreFields: [fieldData]);

        if (fieldHasFocus == !formHadFocusedFieldBefore) {
          onFocusChanged(fieldHasFocus);
        }
      });
      fieldData.markAsTracked();
    }
  }

  bool _hasFocusedField({List<StreamableFormFieldData> ignoreFields}) {
    final fieldsToCheck =
        _formData.fieldData.toSet().difference(ignoreFields.toSet());

    for (final fieldData in fieldsToCheck) {
      if (fieldData.isInFocus) return true;
    }
    return false;
  }
}
