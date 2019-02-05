import 'package:flutter/material.dart';
import 'package:form/index.dart';
import 'package:form_components/index.dart';

import 'data/index.dart';

typedef AddressGetter = String Function();
typedef ParamsGetter = Map<String, dynamic> Function();

class RoofStreamForm extends StreamForm<StreamableFormFieldData,
    StreamableFormSectionHeaderData> {
  final Future<StreamableFormData> _initialFormData;
  final AddressGetter _getAddress;
  final ParamsGetter _getParams;

  Future<StreamableFormData> get initialFormData async => _initialFormData;

  String get address => _getAddress();
  Map<String, dynamic> get params => _getParams();

  RoofStreamForm(
      {Future<StreamableFormData> initialFormData,
      AddressGetter getAddress,
      ParamsGetter getParams})
      : _initialFormData = initialFormData,
        _getAddress = getAddress,
        _getParams = getParams;

  Widget buildTextField(
      {FormTextFieldData fieldData, int fieldIndex, int sectionIndex}) {
    return RoofTextField(
        fieldName: fieldData.title,
        placeholder: fieldData.placeholder,
        initialValue: fieldData.value,
        isPassword: false,
        autofocus: fieldData.autofocus,
        textInputAction: fieldData.inputAction);
  }

  Widget buildTextArea(
      {FormTextAreaData fieldData,
      int fieldIndex,
      int sectionIndex,
      bool autofocus,
      TextInputAction textInputAction}) {
    return RoofTextArea(
        fieldName: fieldData.title,
        placeholder: fieldData.placeholder,
        initialValue: fieldData.value,
        autofocus: autofocus,
        textInputAction: textInputAction);
  }

  Widget buildSwitch(
      {FormSwitchData fieldData, int fieldIndex, int sectionIndex}) {
    return RoofSwitchField(
        title: fieldData.title, isOnInitially: fieldData.initialValue);
  }

  Widget buildOptionSelect(
      {FormOptionSelectData fieldData, int fieldIndex, int sectionIndex}) {
    List<RoofSelectFieldOptionData> options = [];
    for (var option in fieldData.options) {
      options.add(
          RoofSelectFieldOptionData(title: option.title, data: option.data));
    }

    return RoofSelectField(
        title: fieldData.title,
        emptyText: fieldData.emptyText,
        isMultiSelect: fieldData.isMultiSelect,
        options: options);
  }

  @override
  Widget buildField(
      {BuildContext context,
      StreamableFormFieldData fieldData,
      int fieldIndex,
      int sectionIndex}) {
    if (fieldData is FormTextFieldData) {
      return buildTextField(
          fieldData: fieldData,
          fieldIndex: fieldIndex,
          sectionIndex: sectionIndex);
    } else if (fieldData is FormTextAreaData) {
      return buildTextArea(
          fieldData: fieldData,
          fieldIndex: fieldIndex,
          sectionIndex: sectionIndex);
    } else if (fieldData is FormSwitchData) {
      return buildSwitch(
          fieldData: fieldData,
          fieldIndex: fieldIndex,
          sectionIndex: sectionIndex);
    } else if (fieldData is FormOptionSelectData) {
      return buildOptionSelect(
          fieldData: fieldData,
          fieldIndex: fieldIndex,
          sectionIndex: sectionIndex);
    }

    return null;
  }
}
