import 'package:flutter/material.dart';
import 'package:form/index.dart';
import 'package:form_components/index.dart';

import 'data/index.dart';

class RoofStreamForm extends StreamForm<StreamableFormFieldData,
    StreamableFormSectionHeaderData> {
  Widget buildTextField(
      {FormTextFieldData fieldData, int fieldIndex, int sectionIndex}) {
    return RoofTextField(
        fieldName: fieldData.title,
        placeholder: fieldData.placeholder,
        initialValue: fieldData.value,
        isPassword: false,
        onChanged: fieldData.onChanged);
  }

  Widget buildTextArea(
      {FormTextAreaData fieldData, int fieldIndex, int sectionIndex}) {
    return RoofTextArea(
        fieldName: fieldData.title,
        placeholder: fieldData.placeholder,
        initialValue: fieldData.value,
        onChanged: fieldData.onChanged);
  }

  Widget buildSwitch(
      {FormSwitchData fieldData, int fieldIndex, int sectionIndex}) {
    return RoofSwitchField(
        title: fieldData.title,
        isOnInitially: fieldData.initialValue,
        onChanged: fieldData.onChanged);
  }

  Widget buildOptionSelect(
      {FormOptionSelectData fieldData, int fieldIndex, int sectionIndex}) {
    convertDataToFieldOptions(List<FormOptionSelectValueData> data) {
      List<RoofSelectFieldOptionData> convertedOptions = [];
      for (var option in data) {
        convertedOptions.add(
            RoofSelectFieldOptionData(title: option.title, data: option.data));
      }
      return convertedOptions;
    }

    convertSelectedOptionsToData(
        List<RoofSelectFieldOptionData> selectedOptions) {
      List<FormOptionSelectValueData> convertedOptions = [];
      for (var option in selectedOptions) {
        convertedOptions.add(
            FormOptionSelectValueData(title: option.title, data: option.data));
      }
      return convertedOptions;
    }

    List<RoofSelectFieldOptionData> options =
        convertDataToFieldOptions(fieldData.options);

    return RoofSelectField(
        title: fieldData.title,
        emptyText: fieldData.emptyText,
        isMultiSelect: fieldData.isMultiSelect,
        options: options,
        onChanged: (selectedOptions) {
          List<FormOptionSelectValueData> convertedOptions =
              convertSelectedOptionsToData(selectedOptions);
          fieldData.onChanged(convertedOptions);
        });
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
