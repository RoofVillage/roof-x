import 'package:flutter/material.dart';
import 'package:form/index.dart';
import 'package:spec/index.dart';
import 'package:form_components/index.dart';

import 'data/index.dart';

abstract class RoofStreamForm extends StreamForm<StreamableFormFieldData,
    StreamableFormSectionHeaderData> {
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
          {FormTextAreaData fieldData, int fieldIndex, int sectionIndex}) =>
      null;

  Widget buildSwitch(
          {FormSwitchData fieldData, int fieldIndex, int sectionIndex}) =>
      null;

  Widget buildOptionSelect(
          {FormOptionSelectData fieldData, int fieldIndex, int sectionIndex}) =>
      null;

  @override
  Widget buildField(
      {BuildContext context,
      StreamableFormFieldData fieldData,
      int fieldIndex,
      int sectionIndex}) {
    print("HUZZAAH $fieldData");
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
